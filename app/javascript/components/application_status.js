const changeStatus = () => {
  const statusButtons = document.querySelectorAll('.status-buttons');
  if (statusButtons) {
    console.log(statusButtons);
    statusButtons.forEach(function(element) {
      const acceptButton = element.querySelector('.accept-button');
      const rejectButton = element.querySelector('.reject-button');
      console.log(acceptButton);
      console.log(rejectButton);
      acceptButton.addEventListener('click', (event) => {
        element.innerHTML = '<p style = "color: #184d47; font-weight: bold">Accepted</p>';
      });
      rejectButton.addEventListener('click', (event) => {
        element.innerHTML = '<p style = "color: #c70039; font-weight: bold">Rejected</p>';
      });
    });
  };
};

export { changeStatus };
