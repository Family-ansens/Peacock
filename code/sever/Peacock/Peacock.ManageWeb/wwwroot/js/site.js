// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your Javascript code.
function PeacockPage() { };

PeacockPage.prototype.ImgUploadSetting = {
    //UploadUrl: 'http://localhost:8901/file/uploadimg',
    UploadUrl: 'http://192.168.1.107:8901/file/uploadimg',
    UploadToken: '123'
};

let systemConfig = new PeacockPage();