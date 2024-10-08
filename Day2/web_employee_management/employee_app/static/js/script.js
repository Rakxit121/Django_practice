document.addEventListener('DOMContentLoaded', function() {
    const levelSelect = document.getElementById('id_level');
    const salaryField = document.getElementById('salary');

    levelSelect.addEventListener('change', function() {
        const selectedLevel = levelSelect.options[levelSelect.selectedIndex].text;

        // Update salary based on the selected level dynamically
        if (selectedLevel === 'Level 1') {
            salaryField.value = '10000';
        } else if (selectedLevel === 'Level 2') {
            salaryField.value = '18000';
        } else if (selectedLevel === 'Level 3') {
            salaryField.value = '30000';
        } else {
            salaryField.value = '0';
        }
    });

    // Trigger salary update on page load
    levelSelect.dispatchEvent(new Event('change'));
});
