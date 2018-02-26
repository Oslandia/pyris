# -*- coding: utf-8 -*-

import setuptools


with open("README.md") as fobj:
    LONG_DESCRIPTION = fobj.read()

INSTALL_REQUIRES = ["flask", "flask-restplus", "psycopg2-binary", "pyaml",
                    "slumber", "gunicorn"]

setuptools.setup(
    name='pyris',
    version='0.5',
    license='BSD',
    url='https://github.com/garaud/pyris',
    packages=setuptools.find_packages(exclude=['data', 'app.yml']),
    include_package_data=True,
    install_requires=INSTALL_REQUIRES,

    author="Damien Garaud",
    author_email='damien.garaud@gmail.com',
    description="INSEE/IRIS geolocalization",
    long_description=LONG_DESCRIPTION,
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Environment :: Web Environment",
        "Intended Audience :: Developers",
        "Operating System :: OS Independent",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
    ]
)
