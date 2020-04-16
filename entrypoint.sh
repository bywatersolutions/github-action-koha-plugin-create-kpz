#!/bin/sh -l

PLUGIN_VERSION=$1
PLUGIN_NAME=$2
MINIMUM_VERSION=$3

echo "PLUGIN VERSION: $PLUGIN_VERSION"
echo "PLUGIN NAME: $PLUGIN_NAME"
echo "MINIMUM VERSION: $MINIMUM_VERSION"

RELEASE_FILENAME="${PLUGIN_NAME}-${PLUGIN_VERSION}.kpz"
echo "RELEASE FILENAME: $RELEASE_FILENAME"

TODAY_ISO=$(date '+%Y-%m-%d')
echo "TODAY ISO: $TODAY_ISO"

cd /github/workspace
mkdir dist
cp -r Koha dist/.
cd dist

PLUGIN_MODULE=$(find . -regex '\./Koha/Plugin/.*[A-Za-z]*\.pm$' | sed '1q;d')
echo "PLUGIN MODULE: $PLUGIN_MODULE"
META_YML=$(find . -regex '\./Koha/Plugin/.*[A-Za-z]*/META\.yml$' | sed '1q;d')

sed -i -e "s/{VERSION}/${PLUGIN_VERSION}/g" ${PLUGIN_MODULE}
sed -i -e "s/{MINIMUM_VERSION}/${MINIMUM_VERSION}/g" ${PLUGIN_MODULE}
sed -i -e "s/1900-01-01/${TODAY_ISO}/g" $PLUGIN_MODULE

if [ -f "$META_YML" ]; then
    sed -i -e "s/{VERSION}/${PLUGIN_VERSION}/g" ${META_YML}
    sed -i -e "s/{MINIMUM_VERSION}/${MINIMUM_VERSION}/g" ${META_YML}
    sed -i -e "s/1900-01-01/${TODAY_ISO}/g" $META_YML
    cat $META_YML
fi

PLUGIN_DIR=${PLUGIN_MODULE::-3}
echo "PLUGIN DIR: $PLUGIN_DIR"

if [ -f "../CHANGELOG.md" ]; then
    echo "CHANGELOG.md found, copying to plugin directory"
    cp ../CHANGELOG.md "$PLUGIN_DIR/CHANGELOG.md"
else
    echo "CHANGELOG.md not found, please add a CHANGELOG.md file to your plugin's root directory"
fi

if [ -f "../README.md" ]; then
    echo "README.md found, copying to plugin directory"
    cp ../README.md "$PLUGIN_DIR/README.md"
else
    echo "README.md not found, please add a README.md file to your plugin's root directory"
fi

zip -r ../${RELEASE_FILENAME} ./Koha
cp ${META_YML} .. # Copy munged META.yml to the root directory
cd ..
rm -rf dist

echo ::set-output name=filename::${RELEASE_FILENAME}
