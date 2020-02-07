#package the extension and copy to package folder for deployment
cd src
rm -f ../package/*
zip -r ../package/package.zip ./ -x "*__MACOSX" -x "*.DS_Store" -x "package.zip"
cp package.json ../package/