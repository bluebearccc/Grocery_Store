/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const minPrice = 0; // Giá trị Min mặc định
const maxPrice = 200; // Giá trị Max mặc định

let currentMinPrice = minPrice;
let currentMaxPrice = maxPrice;

const sliderContainer = document.querySelector('.slider-container');
const sliderTrack = document.getElementById('slider-track');
const minThumb = document.getElementById('min-thumb');
const maxThumb = document.getElementById('max-thumb');
const minPriceDisplay = document.getElementById('min-price-display');
const maxPriceDisplay = document.getElementById('max-price-display');
const minPriceInput = document.getElementById('min-price');
const maxPriceInput = document.getElementById('max-price');

// Kích thước của slider
const sliderWidth = sliderContainer.clientWidth;

// Cập nhật vị trí của thumb và track
function updateSlider() {
    const minPos = ((currentMinPrice - minPrice) / (maxPrice - minPrice)) * sliderWidth;
    const maxPos = ((currentMaxPrice - minPrice) / (maxPrice - minPrice)) * sliderWidth;

    minThumb.style.left = `${minPos}px`;
    maxThumb.style.left = `${maxPos}px`;
    sliderTrack.style.left = `${minPos}px`;
    sliderTrack.style.width = `${maxPos - minPos}px`;

    minPriceDisplay.textContent = currentMinPrice;
    maxPriceDisplay.textContent = currentMaxPrice;

    // Gán giá trị cho input hidden để submit form
    minPriceInput.value = currentMinPrice;
    maxPriceInput.value = currentMaxPrice;
}

// Di chuyển thumb
function setupThumb(thumb, isMin) {
    thumb.addEventListener('mousedown', (event) => {
        event.preventDefault();

        const onMouseMove = (e) => {
            const rect = sliderContainer.getBoundingClientRect();
            let newPos = e.clientX - rect.left;

            if (newPos < 0)
                newPos = 0;
            if (newPos > sliderWidth)
                newPos = sliderWidth;

            let newValue = Math.round((newPos / sliderWidth) * (maxPrice - minPrice) + minPrice);

            if (isMin) {
                if (newValue < currentMaxPrice) {
                    currentMinPrice = newValue;
                }
            } else {
                if (newValue > currentMinPrice) {
                    currentMaxPrice = newValue;
                }
            }

            updateSlider();
        };

        const onMouseUp = () => {
            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);
        };

        document.addEventListener('mousemove', onMouseMove);
        document.addEventListener('mouseup', onMouseUp);
    });
}

// Setup thumb cho Min và Max
setupThumb(minThumb, true);
setupThumb(maxThumb, false);

// Cập nhật giá trị ban đầu
updateSlider();

