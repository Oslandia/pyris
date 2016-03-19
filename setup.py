# -*- coding: utf-8 -*-

import setuptools


with open("README.md") as fobj:
    LONG_DESCRIPTION = fobj.read()


setuptools.setup(
    name='pyris',
    version='0.1',
    license='BSD',
    url='https://github.com/garaud/pyris',
    packages=setuptools.find_packages(exclude=['data', 'app.yml']),
    include_package_data=True,
    install_requires=["flask", "flask-restplus", "pyaml"],

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
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5",
    ]
)
