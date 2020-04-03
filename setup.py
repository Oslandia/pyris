# -*- coding: utf-8 -*-

import setuptools

with open("README.rst") as fobj:
    LONG_DESCRIPTION = fobj.read()

INSTALL_REQUIRES = ["Flask==1.0.2",
                    "flask-restplus==0.12.1",
                    "Werkzeug==0.16.1",
                    "psycopg2-binary",
                    "pyaml",
                    "slumber",
                    "gunicorn==19.9", ]

setuptools.setup(
    name='pyris',
    version='0.7',
    license='BSD',
    url='https://github.com/Oslandia/pyris',
    packages=setuptools.find_packages(exclude=['data', 'app.yml']),
    include_package_data=True,
    install_requires=INSTALL_REQUIRES,
    # pip install -e .[dev]
    extras_require={'dev': ['pytest', 'pytest-sugar', 'ipython', 'ipdb']},

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
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
    ]
)
