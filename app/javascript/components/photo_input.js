const initPhotoInput = () => {
    const photoButton = document.querySelector(".photo-button");
    const photoInput = document.querySelector(".photo-input");
    const fileNames = document.querySelector(".file-names");
    if (photoButton) {
        photoButton.addEventListener('click', () => {
            photoInput.click()
        });
        photoInput.addEventListener('change', () => {
            const files = photoInput.files;
        fileNames.innerHTML = `${files.length} files uploaded`    
        
        });
    }
}

export {initPhotoInput}