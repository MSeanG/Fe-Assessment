# CGM Front-End (React) Coding Assessment

## Prerequisites

Ensure the following are installed on your PC.

1. [Docker](https://www.docker.com/)
   - Ensure Docker is correctly configured for your OS
2. [VSCode](https://code.visualstudio.com/)
3. VSCode Extensions
   - [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Overview

To complete this assessment, you will need to write a simple [React](https://facebook.github.io/react/) web app that is built with [Next.js](https://nextjs.org/). You will then provide us with the source files from this assessment.

The purpose of this assessment is to assess your **skills and approach to composing a simple web app** given an API feed. We will also assess the **generated HTML, Styling, and JS** output.


## Getting Started

### Opening the project

The following steps will open the assessment in a docker container that contains everything needed to run the app.

1. Using VSCode install the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension.
2. Extract the provided zip to a directory of your choosing
3. Open the extracted directory with VSCode
4. Press `F1` to bring up the Command Palette and type in ```Remote-Containers```
5. Select `'Reopen in Container'`

### Install Project Dependencies 
Run the following in a terminal to install the project dependencies.
```bash
npm i
```

### Run  Next.js
Run the following in a terminal to start next.js in development mode.
```bash
npm run dev
```

## What to do?

Your goal is to implement a simple React application, where users will be able to view a job candidate's resume and written responses, comment on the responses & save the data. The UX/UI is totally up to you.

Although it's a very basic exercise, we will be looking for simple, well-designed, well-commented code in the submission.

Once you complete your implementation zip up your source code.

***Do not include the node_modules directory***

Return it to us by replying to the email we sent you and attaching your zip.



## How should the application work?

The user of this react application should be able to view the resume of job candidates applying for a job at their company. The application should have the following workflow,

1. Choose a candidate from a list.
2. Depending on the selection in the first step, if the selected candidate has an application, display the resume and the written responses of the candidate with the relevant question displayed in text. If the selected candidate does not have an application, display an appropriate message.
3. For each written response of a candidate, provide an option to enter comments.
4. Provide a "Save" button that saves the comments to the API.

## Requirements

- Only step 1 should be visible when no candidate is picked. Steps 1,2,3 and 4 should be visible when a candidate is picked.

- Users should be able to change candidate selection at any time.

- You can use whatever libraries, task runners, and build processes you like (We like Material UI and Styled-Components to name a few). React and plain JavaScript is the only requirements (ES6+ encouraged, but no TypeScript, CoffeeScript, etc).

## API Usage
The [Thunder Client](https://www.thunderclient.com/) extension is included. Once the project loads you should be able to test the API endpoints from the Collections tab. We have also provided the API documentation below.

| Endpoint                                                     | Method | Result                                                         |
| ------------------------------------------------------------ | ------ | -------------------------------------------------------------- |
| /api/candidates                                              | GET    | Lists all available candidates                                 |
| /api/candidates/applications/application-responses/questions | GET    | Lists all database relations                                   |
| /api/questions                                               | GET    | Lists all available questions                                  |
| /api/applications                                            | GET    | Lists all available applications                               |
| /api/applications/{id}                                       | GET    | List application by candidate id                               |
| /api/applications/{id}/application-responses                 | GET    | List application with responses by candidate id                |
| /api/application-responses                                   | GET    | Lists all available application responses                      |
| /api/application-responses/{id}                              | GET    | List application responses by application id                   |
| /api/application-responses/{id}/comment                      | PATCH  | Update application response comment by application response id |

---
