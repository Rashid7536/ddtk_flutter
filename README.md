# clean_ddkt_2

## ddkt_flutter
### Project Overview
ddtk_flutter is a Flutter-based mobile application designed for managing and monitoring patients who are donors or recipients of diseased donor kidneys for transplant purposes. The app serves as a medical portfolio for patients, allowing storage and tracking of essential data related to their health and transplant journey.

### Key Features
- Patient Data Management: The app enables storing and tracking patient information, including personal details, medical history, and transplant-related data.
- Cloud Integration: Utilizes Firebase as the backend database to securely store patient records in the cloud, enabling remote access and management.
- Structured Data: Patient records are structured with fields such as blood group, date of data entry, date of birth, national ID, name, PRA level, phone number, residential place, province, reference unit, sex, special conditions, and patient status.

##Getting Started
1. Clone the repository:
git clone https://github.com/Rashid7536/ddtk_flutter.git

2. Install dependencies:
cd ddtk_flutter
flutter pub get

4. Set up Firebase:
- Create a new Firebase project in the Firebase Console.
- Add the Firebase configuration to the android/app/google-services.json and ios/Pod/Contents/info.plist files.
- Initialize Firebase in the app by running flutter firebase init and selecting the appropriate options.

5. Run the app:

For Android:

---
> flutter run


### Usage

Add a new patient:
Navigate to the patient management screen.
Tap the "Add Patient" button.
Fill in the required fields with patient information.
Save the patient record.

View patient records:
The app displays a list of all registered patients.
Tap on a patient's record to view their detailed information.

Update patient data:
Navigate to the patient's record.
Modify the desired fields with updated information.
Save the changes.

Access patient data remotely:
The data is stored in the Firebase database, allowing authorized users to access and monitor patient records from anywhere.

### Contributing
Contributions to the ddtk_flutter project are welcome! To contribute:

### Fork the repository.
Create your feature branch (git checkout -b feature/new-feature).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature/new-feature).
Create a new Pull Request against the main branch.
Please ensure that all changes adhere to the coding standards and guidelines followed in the project.

### License
This project is licensed under the MIT License. See the LICENSE file for more information.

### Contact
For any questions or contributions, please contact me at rashidaman05@gmail.com

### Acknowledgements
- Flutter Framework
- Firebase Database
- Other third-party libraries and dependencies used in the project
