import flatpickr from "flatpickr";



const flatPick = () => {
    const inputs = document.querySelectorAll(".form-design")
    console.log(inputs)
    inputs.forEach((input) => {
        flatpickr(input, {
            disableMobile: true
        });
    });
};

export { flatPick }
