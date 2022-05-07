let picturePreview = document.querySelector(".imagePreview");
let actionButton = document.querySelector(".action-button");
let l =document.getElementsByClassName("hidden");
let fileInput = l[0];
let fileReader = new FileReader();

const DEFAULT_IMAGE_SRC = "https://www.newdelhiairport.in/src/images/advertise/upload.jpg";

actionButton.addEventListener("click", () => {
  if ( picturePreview.src !== DEFAULT_IMAGE_SRC ) {
    resetImage();
  } else {
    fileInput.click();
  }
});

fileInput.addEventListener("change", () => {
  refreshImagePreview();
});

function resetImage() {
  setActionButtonMode("upload");
  picturePreview.src = DEFAULT_IMAGE_SRC;
  fileInput.value = "";
}

function setActionButtonMode(mode) {
  let modes = {
    "upload": function() {
      actionButton.innerText = "Upload avatar";
      actionButton.classList.remove("mode-remove");
      actionButton.classList.add("mode-upload");
    },
    "remove": function() {
      actionButton.innerText = "Remove avatar";
      actionButton.classList.remove("mode-upload");
      actionButton.classList.add("mode-remove");
    }
  }
  return (modes[mode]) ? modes[mode]() : console.error("unknown mode");
}

function refreshImagePreview() {
  if ( picturePreview.src !== DEFAULT_IMAGE_SRC ) {
    picturePreview.src = DEFAULT_IMAGE_SRC;
  } else {
    if ( fileInput.files && fileInput.files.length > 0 ){
      fileReader.readAsDataURL(fileInput.files[0]);
      fileReader.onload = (e) => {
        picturePreview.src = e.target.result;
        setActionButtonMode("remove");
      }
    }
  }
}

refreshImagePreview();