# SCPFioriApp4WebClient
A Purchase Order Fiori  App on SCP for Web Client prove the loosely-couple approach is also valid for Web Client. The fiori app will be deployed to web client via Extension Manager, which will create a tile to open the fiori app running on SCP.

# How to package, deploy and run the extension to Web Client
## Package the extension
1.Clone the project to your local with terminal command below
``` 
git clone https://github.wdf.sap.corp/B1SA/SCPFioriApp4WebClient.git 
```

2.Change the current working directory to project root folder SCPFioriApp4WebClient with command:
``` 
cd SCPFioriApp4WebClient
```

3.Update the target url of web app in src/FioriContainerApp/view/Container.view.xml
```html
<html:iframe id="fiori_iframe" src="<PLEASE_REPLACE_WITH_YOUR_TARGET_WEB_APP_URL>" target="_top"
							height="100%" width="100%"></html:iframe>
```

4.Update the appTitle and title in src/FioriContainerApp/i18n/i18n.properties. For example:
```
appTitle=Fiori App on SCP
appDescription=
title=Purchase Orders
```
5.Update the src/pacakge.json
```json
{
	"name": "<extension name>",
	"description": "<description of your extension>",
	"version": "<version. for example. 0.0.1>",
	"vendor": "<Your company>",
	"multiple-version": "false",
	"fiori-app": [
		{
			"name": "<name of fiori app showed in the tile of extension in Web Client. For example: po-fiori-scp>",
			"folder": "FioriContainerApp"
		}
	]
}

```
6.Run the script(package.sh) to package the extension.  
```sh
./package.sh
```
As a result, package.json and package.zip are output to package folder
<br>package
<br>   -package.json
<br>   -package.zip <br>

7.Provision your package to a http server as the registration require url of the package when registering the extension in Extension Manager.<br>
For example, push your pacakge to github or upload the package folder to a CDN website. The required package structure:
```
package.json
package.zip
```

## Deploy your extension to Web Client through Extensin Manager
1.Open the extension manager with url: https://<YOUR_SLD_Host>:40000/ExtensionManager.<br>

2.Login the extension manager with user B1SiteUser and password.<br>

3.On Extensions tab, Register the extension by clicking Register button, and enter url as url to the package.json. For instance, https://github.wdf.sap.corp/raw/B1SA/SCPFioriApp4WebClient/master/package/package.json (Note: if the pakcage is provisioned via github, the url should be for raw content of package.json without any github page information)

## Run your extension in Web Client