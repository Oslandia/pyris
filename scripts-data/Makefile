# Retrieve the filename from an URL
# Param:
#   1. parsed string with the form 'https://website.jazz/path/to/file.zip'.
url2file = $(lastword $(subst /, ,$1))

# Downloading folder
DOWNLOADDIR=download
# Folder to process some data
DATADIR=data

# IGN URLs : IRIS 2017 contours
IGN_URL=https://wxs-telechargement.ign.fr/1yhlj2ehpqf3q6dt6a2y7b64/telechargement/inspire/CONTOURS-IRIS-2018-06-08$$CONTOURS-IRIS_2-1__SHP__FRA_2018-06-08/file/CONTOURS-IRIS_2-1__SHP__FRA_2018-06-08.7z
IGN_ZIP_FILE=contour-iris.7z
IGN_REFERENCE_SHAPEFILE=CONTOURS-IRIS_2-1__SHP__FRA_2018-06-08/CONTOURS-IRIS/1_DONNEES_LIVRAISON_2018-06-00105/CONTOURS-IRIS_2-1_SHP_LAMB93_FXX-2017/CONTOURS-IRIS.shp
IGN_SHAPEFILE=$(addsuffix -metropole-2017.shp, $(basename $(notdir $(IGN_REFERENCE_SHAPEFILE))))

# Insee Data : IRIS 2017 and census 2015 (IRIS)
INSEE_URL=https://www.insee.fr/fr/statistiques/fichier/2017499/reference_IRIS_geo2017.zip
INSEE_ZIP_FILE=iris-insee-2017.zip
INSEE_REFERENCE_FILE=reference_IRIS_geo2017.xls
INSEE_INFRA_URLS := https://www.insee.fr/fr/statistiques/fichier/3627376/base-ic-evol-struct-pop-2015.zip \
	https://www.insee.fr/fr/statistiques/fichier/3627367/base-ic-couples-familles-menages-2015.zip \
	https://www.insee.fr/fr/statistiques/fichier/3627372/base-ic-diplomes-formation-2015.zip \
	https://www.insee.fr/fr/statistiques/fichier/3627374/base-ic-logement-2015.zip \
        https://www.insee.fr/fr/statistiques/fichier/3627009/base-ic-activite-residents-2015.zip \
# French national addresses data
BAN_URL = http://bano.openstreetmap.fr/data/full.sjson.gz
BAN_ZIP_FILE = $(call url2file, $(BAN_URL))
BAN_FILE = $(addprefix bano-, $(subst .gz,, $(BAN_ZIP_FILE)))

# File list to download
# Loop on ech url to retrieve the .zip filename
INSEE_INFRA_ZIPFILES := $(foreach url, $(INSEE_INFRA_URLS), $(DOWNLOADDIR)/$(call url2file, $(url)))
# Loop on each .zip file and then replace .zip by .xls. From the 'download' folder to the 'data' folder.
INSEE_INFRA_FILES := $(subst $(DOWNLOADDIR)/,$(DATADIR)/, $(subst .zip,.xls, $(INSEE_INFRA_ZIPFILES)))
# .xls files to .csv
INSEE_INFRA_CSV := $(subst .xls,.csv, $(INSEE_INFRA_FILES))
# $(info INSEE_INFRA_FILES IS $(INSEE_INFRA_FILES))
# $(info INSEE_INFRA_CSV IS $(INSEE_INFRA_CSV))


# Before removing the folder content, check the variables DATADIR et
# DOWNLOADDIR. They must exist and be non empty.
ifndef DATADIR
$(error DATADIR is not set)
endif

ifndef DOWNLOADDIR
$(error DOWNLOADDIR is not set)
endif

.PHONY: all
all: download unzip copydatadir tocsv

.PHONY: download
download: $(DOWNLOADDIR)/$(IGN_ZIP_FILE) $(DOWNLOADDIR)/$(INSEE_ZIP_FILE) $(INSEE_INFRA_ZIPFILES) $(DOWNLOADDIR)/$(BAN_ZIP_FILE)

.PHONY: unzip
unzip: $(DOWNLOADDIR)/$(INSEE_REFERENCE_FILE) $(DOWNLOADDIR)/$(IGN_REFERENCE_SHAPEFILE) $(INSEE_INFRA_FILES)

.PHONY: copydatadir
copydatadir: $(DATADIR)/insee-iris.xls $(DATADIR)/$(IGN_SHAPEFILE) $(DATADIR)/$(BAN_FILE)

.PHONY: tocsv
tocsv: $(DATADIR)/insee-iris.csv $(INSEE_INFRA_CSV)

.PHONY: clean
clean: cleandata cleandownload

.PHONY: cleandata
cleandata:
	rm -f $(DATADIR)/*

.PHONY: cleandownload
cleandownload:
	rm -rf $(DOWNLOADDIR)/*


# Allow you to loop on all URLs (Insee) and generate as many URLS as targets. The
# target will be infer from the name of the file.
include downloads.mk

downloads.mk: Makefile
	@rm -f $@
	@for f in $(INSEE_INFRA_URLS); do \
                _dir=$(DOWNLOADDIR) ; \
		out=`echo $$f | awk -F "/" '{print $$NF}'`; \
                echo "$$_dir/$$out: \n\twget $$f -O \$$@\n\n" >> $@; \
        done


# IGN File
$(DOWNLOADDIR)/$(IGN_ZIP_FILE):
	mkdir -p $(dir $@)
	wget '$(IGN_URL)' -O $@

$(DOWNLOADDIR)/$(IGN_REFERENCE_SHAPEFILE): $(DOWNLOADDIR)/$(IGN_ZIP_FILE)
	7z x -stl -o$(DOWNLOADDIR) $<

# copy all files with the same stem of the .shp file (.prf, .dbf) etc.
$(DATADIR)/$(IGN_SHAPEFILE): $(DOWNLOADDIR)/$(IGN_REFERENCE_SHAPEFILE)
	mkdir -p $(dir $@)
	# shapefile
	cp $< $@
	# other extensions : dbf, etc.
	cp $(addsuffix .cpg, $(basename $<)) $(addsuffix .cpg, $(basename $@))
	cp $(addsuffix .dbf, $(basename $<)) $(addsuffix .dbf, $(basename $@))
	cp $(addsuffix .prj, $(basename $<)) $(addsuffix .prj, $(basename $@))
	cp $(addsuffix .shx, $(basename $<)) $(addsuffix .shx, $(basename $@))


# Address data
$(DOWNLOADDIR)/$(BAN_ZIP_FILE):
	wget '$(BAN_URL)' -O $@

# Unzip files into the 'data' folder
$(DATADIR)/$(BAN_FILE): $(DOWNLOADDIR)/$(BAN_ZIP_FILE)
	gzip -c -d $< > $@


# Insee IRIS files
$(DOWNLOADDIR)/$(INSEE_ZIP_FILE):
	mkdir -p $(dir $@)
	wget '$(INSEE_URL)' -O $@

$(DOWNLOADDIR)/$(INSEE_REFERENCE_FILE): $(DOWNLOADDIR)/$(INSEE_ZIP_FILE)
	unzip -DD $< -d $(DOWNLOADDIR)

# Insee IRIS data
$(DATADIR)/insee-iris.xls: $(DOWNLOADDIR)/$(INSEE_REFERENCE_FILE)
	mkdir -p $(dir $@)
	cp $< $@

# Convert Excel files into a CSV files thanks to csvkit
$(DATADIR)/insee-iris.csv: $(DATADIR)/insee-iris.xls
	in2csv -e LATIN1 --sheet Emboitements_IRIS -K 5 $< > $@

# Some other Insee files. Unzip files from 'download' into the 'data' folder
$(INSEE_INFRA_FILES): $(INSEE_INFRA_ZIPFILES)
	unzip -DD $(subst $(DATADIR)/,$(DOWNLOADDIR)/, $(subst .xls,.zip,$@)) -d $(DATADIR)

# Convert Excel files into a CSV files thanks to csvkit
$(INSEE_INFRA_CSV): $(INSEE_INFRA_FILES)
	in2csv -e LATIN1 --sheet IRIS -K 5 $(subst .csv,.xls,$@) > $@
