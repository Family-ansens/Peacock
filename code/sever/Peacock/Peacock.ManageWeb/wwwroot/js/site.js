// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your Javascript code.
function PeacockPage() { }

PeacockPage.prototype.ImgUploadSetting = {
    //UploadUrl: 'http://localhost:8901/base/uploadimg',
    //UploadUrl: 'http://localhost:5000/base/uploadimg',
    //UploadUrl: 'http://192.168.1.107:8901/file/uploadimg',
    UploadUrl: 'http://www.puwiremesh.com:8901/file/uploadimg',
    KindEditorUploadUrl: 'http://www.puwiremesh.com:5000/Base/UploadImg4KindEditor',
    UploadToken: '123'
};

let systemConfig = new PeacockPage();