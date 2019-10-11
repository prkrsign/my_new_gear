$(document).on('turbolinks:load', function(){
    $(document).on("change", '#file_photo', function(e){
        var reader;
        if (e.target.files.length){
            reader = new FileReader
            reader.onload = function(e){
                var gearImage;
                gearImage = document.getElementById('image')
                $("#gearImgPreview").addClass("image-active");
                gearImage.setAttribute('src', e.target.result);
            };
            return reader.readAsDataURL(e.target.files[0]);            
        }
    });
})