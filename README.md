# PackerTemplates

## How to use

*Rename env.json.template in file env.json, here you need to set your vcenter server, username and password.*
```json
{
    "vcenter_server": "vcenter.localhost.local",
    "vcenter_username": "administrator@vsphere.local",
    "vcenter_password": "TotoLePlusBeau",
}
```
*Then you can build your template.*

## Build a template with Script
*You can use the script `main.ps1` to build a template.*

```powershell
.\main.ps1
```
## Build a template manually
*You can use the command `packer build` to build a template.*

```bash
cd DirectoryOfYourTemplate
packer build -var-file ..\env.json .
```


## Templates
- [x] Ubuntu 20.04 with Docker
- [x] Empty pfSense 2.7.2 Community Edition
- [x] Windows 2022 Server Standard

## DEBUG
If you have an error during launch, try install Windows ADK in order to have the command `OSCDIMG` available on Windows.
