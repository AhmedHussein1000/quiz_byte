# quiz_byte
 
A Flutter application for testing your knowledge with quizzes across different programming categories and difficulty levels, built with GetX state management.

## Demo

[Watch the Demo] https://drive.google.com/file/d/17r4xo2GMfhKw6iRDONd_8ixzi4kTnSfM/view?usp=sharing

## Features

- Browse Quiz Categories

- Select Difficulty Levels

- Answer Multiple-Choice Questions

- Track Your Score

- Loading Animations

- Responsive UI

## Screens

- Welcome Screen

- Category Selection Screen

- Quiz Screen

- Score Screen


## Tech Stack

- Flutter - UI Framework
- GetX - State Management
- Dio - API Client
- Dartz - Functional Programming
- Get_It - Dependency Injection
- Shared Preferences - Local Storage
- Skeletonizer - Loading Placeholders
- Flutter SVG - SVG Support

## Project Structure

```bash

lib/
├── core/
│   ├── cache/
│   ├── di/
│   ├── error/
│   ├── functions/
│   ├── helpers/
│   ├── routes/
│   ├── themes/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── categories/
│       ├── controllers/
│       ├── models/
│       ├── repository/
│       └── views/
│   ├── quiz/
│       ├── controllers/
│       ├── models/
│       ├── repository/
│       └── views/
│   └── score/
│       ├── controllers/
│       └── views/
└── main.dart