---
# TownSquare - Today's Activities Screen

This project is a part of the hiring process for CeleBreak. It implements the **"Today's Activities"** screen for the TownSquare app using Flutter. The screen allows users to view and interact with activities for the day.
---

## Features

- **View today's activities:** Displays a list of activities with essential details.
- **Filter by category:** Users can filter activities by categories like Sports, Food, Kids, and Creative.
- **Join an activity:** A "Join" button for each activity.
- **Animations:** Smooth transitions for filtering and interactions.
- **Cross-platform:** Fully compatible with Android, iOS, and Web.

---

## How to Run the Project

### Prerequisites

1. [Install Flutter](https://docs.flutter.dev/get-started/install) on your system.
2. [Install python](https://www.python.org/downloads/) on your system too.
3. Ensure you have an Android/iOS emulator or a physical device connected.
4. Install the dependencies by running:
   ```bash
   flutter pub get
   ```

### Steps to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/jrdeavila/townsquare_celebrake.git
   ```
2. Navigate to the project directory:

   ```bash
   cd townsquare_celebrake

   ```

3. Rename folder to townsquare (It's the real project's name):
   ```bash
   mv townsquare_celebrake townsquare
   ```
4. Run the app:
   ```bash
   flutter run
   ```
5. For the web version, build and serve the project:
   ```bash
   flutter build web
   ```
6. Go to build/web folder and run:
   ```
   bash
   cd build/web
   python -m http.server 8000
   ```

---

## Assumptions Made

- The activities data is hardcoded for the purpose of this task.
- Animations and UI transitions are kept minimal to focus on functionality.
- Firebase Hosting was used to deploy the web version.

---

## What Could Be Improved

- **Dynamic Data:** Connect the app to a backend API for real-time activities data.
- **Enhanced Animations:** Add more sophisticated animations for a better user experience.
- **Localization:** Add multi-language support for a global audience. **(Done)**
- **UI Testing:** Implement automated tests for UI and functionality.

---

## Submission Details

- **Live Demo URL:** https://celebrake-townsquare-web-app.web.app
- **Demo Video:** https://1drv.ms/f/c/5aa6cc52bf2c894a/EumGA9UG_WhBjpkoFyyZjBoBxzglv7r6xNiP82jvnA79qg?e=fFQPjQ
- **GitHub Repository:** https://celebrake-townsquare-web-app.web.app/#/main-activity

---

## Contact

If you have any questions or need further details, feel free to reach out!

---
