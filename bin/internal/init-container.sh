#!/bin/sh

#######################################################################
# This program and the accompanying materials are made available
# under the terms of the Eclipse Public License v2.0 which
# accompanies this distribution, and is available at
# https://www.eclipse.org/legal/epl-v20.html
#
# SPDX-License-Identifier: EPL-2.0
#
# Copyright Contributors to the Zowe Project.
#######################################################################

#######################################################################
# Prepare runtime directory when Zowe is running in containers

# exit if there are errors
set -e

#######################################################################
# Constants
SOURCE_DIR=/component
RUNTIME_DIR=/home/zowe/runtime
INSTANCE_DIR=/home/zowe/instance

#######################################################################
echo ">>> prepare runtime directory"
mkdir -p ${RUNTIME_DIR}/components
cp -r ${SOURCE_DIR}/. ${RUNTIME_DIR}

#######################################################################
echo ">>> prepare instance directory"
# we need to do pretty much same as bin/zowe-configure-instance.sh
mkdir -p ${INSTANCE_DIR}/bin
mkdir -p ${INSTANCE_DIR}/logs
# <instance>/bin/install-app.sh has been pulled into zowe-launch-scripts image and put into <runtime>/bin/instance
cp -r ${RUNTIME_DIR}/bin/instance/. ${INSTANCE_DIR}/bin
# zowe-configure-component.sh will be executed during runtime
