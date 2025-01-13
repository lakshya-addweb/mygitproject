public class ContactImageUploadController {
    public Blob fileBody { get; set; }
    public String fileName { get; set; }
    public Boolean showCrop { get; set; }
    public String filePreview { get; set; }
    public Id attachmentId { get; set; }
    private final Contact contact;

    public ContactImageUploadController(ApexPages.StandardController stdController) {
        this.contact = (Contact) stdController.getRecord();
        showCrop = false;
    }
    
    public void upload() {
        if (fileBody != null && fileName != null) {
            // Convert Blob to base64 to preview the image
            String base64FileBody = EncodingUtil.base64Encode(fileBody);
            filePreview = 'data:image/png;base64,' + base64FileBody;
            showCrop = true;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'File upload failed.'));
        }
    }

    @RemoteAction
    public static String saveCroppedImage(String croppedImageData) {
        try {
            // Extract the base64 data
            String base64Data = croppedImageData.split('base64,')[1];
            Blob croppedImageBlob = EncodingUtil.base64Decode(base64Data);

            // Save the cropped image as an Attachment
            Attachment attachment = new Attachment();
            attachment.Body = croppedImageBlob;
            attachment.Name = 'CroppedImage.png';
            attachment.ParentId = ApexPages.currentPage().getParameters().get('id'); // Use the Contact ID from the URL
            insert attachment;

            // Return the Attachment ID to display the uploaded image
            return attachment.Id;
        } catch (Exception e) {
            return 'Error: ' + e.getMessage();
        }
    }
}