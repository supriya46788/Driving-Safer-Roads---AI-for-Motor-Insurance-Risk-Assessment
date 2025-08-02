
# Contributing to BimaRakshak AI

Thank you for contributing to BimaRakshak AI.

## Steps to Contribute

### 1. Fork the Repository

Go to: https://github.com/supriya46788/Driving-Safer-Roads---AI-for-Motor-Insurance-Risk-Assessment  
Click the **“Fork”** button on the top right.

### 2. Clone Your Fork

```bash
git clone https://github.com/supriya46788/Driving-Safer-Roads---AI-for-Motor-Insurance-Risk-Assessment.git
cd Driving-Safer-Roads---AI-for-Motor-Insurance-Risk-Assessment
```

### 3. Create a New Branch

```bash
git checkout -b feature/your-feature-name
```

> Use a meaningful branch name (e.g., `fix/login-error`, `feature/ai-risk-score`).

### 4. Set Up Locally

#### Backend (Django)

```bash
pip install -r requirements.txt
python manage.py migrate
```

#### Frontend (Flutter)

```bash
flutter pub get
flutter run
```

#### Firebase

- Set up Firebase project
- Enable Email/Password Authentication
- Add `google-services.json` or `GoogleService-Info.plist` to your project

### 5. Make Changes

- Keep code clean and modular
- Test your changes before committing
- Avoid breaking existing features

### 6. Commit & Push

```bash
git add .
git commit -m "feat: describe your change here"
git push origin feature/your-feature-name
```

### 7. Create a Pull Request

- Go to your fork on GitHub
- Click **"Compare & pull request"**
- Write a clear description of what you changed
- Submit

---

## Notes

- Do not push to `main` directly
- One PR per feature or fix
- If stuck, open an issue with details

Thank you!
