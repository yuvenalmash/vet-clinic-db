<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[vet-clinic-db\] ](#-vet-clinic-db-)
  - [Database diagrams](#database-diagrams)
    - [Schema](#schema)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started \]](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 [vet-clinic-db] <a name="about-project"></a>

**[vet-clinic-db]** is a program that creates a data base for a vet clinic.
## Database diagrams
### Schema
<!-- Schema -->
<img title="Schema" alt="schema diagram" src="/images/schema.png">

## 🛠 Built With <a name="built-with"></a>
- postgresql

### Tech Stack <a name="tech-stack"></a>

<details>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[Creates animals table]**
- **[Populates the table with animals]**
- **[Make different queries]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>]

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:
- install postgreSQL

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone https://github.com/yuvenalmash/vet-clinic-db.git
```

### Usage

1. Connect to your PostgreSQL server with `psql`
```
> psql
postgres=#
```

2. Create the database `vet_clinic`
```
postgres=# CREATE DATABASE vet_clinic;
CREATE DATABASE
```

3. Connect to your database vet_clinic. Inside your current session do:
```
postgres=# \c vet_clinic
You are now connected to database "vet_clinic" as user "postgres".
vet_clinic=#
```

You have created your database and connected to it. Next, add a table.

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Yuvenal Njoroge**

- GitHub: [@yuvenalmash](https://github.com/yuvenalmash)
- Twitter: [@_Juvenal_](https://twitter.com/_Juvenal)
- LinkedIn: [Yuvenal Njoroge](https://linkedin.com/in/yuvenal-njoroge)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Increase functionality]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/yuvenalmash/vet-clinic-db/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank microverse for the inspiration.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._

<p align="right">(<a href="#readme-top">back to top</a>)</p>
