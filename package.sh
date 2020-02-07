#package the extension and copy to package folder for deployment
zip -r package/package.zip src/ -x "*__MACOSX" -x "*.DS_Store" -x "package.zip"
cp src/package.json package/