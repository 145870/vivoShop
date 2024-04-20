var scrollAmount = 1212; // 滑动的宽度
var currentTranslateX = 0;
const element = document.getElementById('re');
const leftButton = document.getElementById('but-zuo').querySelector('button');
const rightButton = document.getElementById('but-you').querySelector('button');

function slideLeft() {
    currentTranslateX += scrollAmount;
    currentTranslateX = Math.min(currentTranslateX, 0);
    element.style.transform = `translateX(${currentTranslateX}px)`;
    updateButtonState();
}

function slideRight() {
    const maxTranslateX = -scrollAmount * (element.children.length - 4); // 最右边的滑动边界
    currentTranslateX -= scrollAmount;
    currentTranslateX = Math.max(currentTranslateX, maxTranslateX);
    element.style.transform = `translateX(${currentTranslateX}px)`;
    updateButtonState();
}

function updateButtonState() {
    leftButton.disabled = currentTranslateX === 0;
    rightButton.disabled = currentTranslateX === -scrollAmount * (element.children.length - 4); // 当滑动到最右边时禁用右滑按钮
}