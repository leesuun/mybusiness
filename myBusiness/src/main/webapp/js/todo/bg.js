const bgimg = document.querySelector("#bg-img");

const images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];

const img = document.createElement("img");

const randomImage = images[Math.floor(Math.random() * images.length)];

img.src = `css/images/${randomImage}`;

bgimg.appendChild(img);
