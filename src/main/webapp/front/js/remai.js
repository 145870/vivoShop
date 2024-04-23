var scrollAmount = 800; // 滑动的宽度
   var currentTranslateX = 0;
   const element = document.getElementById('re');
   const leftButton = document.getElementById('but-zuo').querySelector('button');
   const rightButton = document.getElementById('but-you').querySelector('button');
  
   
   function slideLeft() {
       currentTranslateX += scrollAmount; // 向左滑动需要增加 translateX 的值
       currentTranslateX = Math.min(currentTranslateX, 0); // 设置左边界
       element.style.transform = `translateX(${currentTranslateX}px)`;
       updateButtonState();
   }
   
   function slideRight() {
       currentTranslateX -= scrollAmount; // 向右滑动需要减小 translateX 的值
       currentTranslateX = Math.max(currentTranslateX, -scrollAmount * 7); // 设置右边界
       element.style.transform = `translateX(${currentTranslateX}px)`;
       updateButtonState();
   }
   
function updateButtonState() {
    leftButton.disabled = currentTranslateX === 0;
    rightButton.disabled = currentTranslateX === -scrollAmount * (element.children.length - 4); // 当滑动到最右边时禁用右滑按钮
}