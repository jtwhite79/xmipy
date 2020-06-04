#!/bin/bash
set -e

echo "Installing pip for Python ${TRAVIS_PYTHON_VERSION} ${RUN_TYPE} run"
pip install --upgrade pip
pip install -r requirements.travis.txt
pip install --no-binary rasterio rasterio
pip install --upgrade numpy
if [ "${RUN_TYPE}" = "style" ]; then
  pip install flake8
fi
pip config --user set global.progress_bar off
pip install https://github.com/modflowpy/pymake/zipball/master
pip install https://github.com/modflowpy/flopy/zipball/develop
pip install shapely[vectorize]
pip install coveralls nose-timer
