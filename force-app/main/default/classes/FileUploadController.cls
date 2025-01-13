public class FileUploadController {
public String Type { get; set; }
public String fileName { get; set; }
public transient blob file { get; set; }
public String title{ get;set; }
public ContentVersion cv { get; set; }
String contactId = System.currentPagereference().getParameters().get('Id');
public FileUploadController(ApexPages.StandardController controller) {
}

public PageReference upload() {
ContentVersion cv = new ContentVersion();
cv.versionData = file;
cv.title = title;
cv.pathOnClient = fileName;
cv.FirstPublishLocationId = contactId;
try
{
Insert cv;
}
catch (DMLException e)
{
ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading Document in Library'));
return null;
}
finally
{
cv = new ContentVersion();
}
ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Document uploaded successfully to library'));
return null;
}
}