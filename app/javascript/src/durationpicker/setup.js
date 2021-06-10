import Stopwatch from "./Stopwatch"
import DurationPickerMaker from "./DurationPickerMaker"
import FormattedDuration from "./FormattedDuration"

class LabelWrapperReceiver {
    constructor(labelElement) {
        this.labelElement = labelElement;
    }

    setSecondsValue(value) {
        this.labelElement.textContent = value;
    }
}

let pickerElement = document.getElementsByClassName('duration_picker_field')[0];

let formattedDuration = new FormattedDuration({
    hoursUnitString: " h ",
    minutesUnitString: " m ",
    secondsUnitString: " s ",
});
let durationPickerMaker = new DurationPickerMaker(formattedDuration);

durationPickerMaker.SetPickerElement(pickerElement, window, document);

let startButton = document.getElementById("startButton");
let stopButton = document.getElementById("stopButton");
let resetButton = document.getElementById("resetButton");

new Stopwatch(
    durationPickerMaker /*seconds observer*/,
    {
        startButton: startButton,
        stopButton: stopButton,
        resetButton: resetButton
    },
    window
);
