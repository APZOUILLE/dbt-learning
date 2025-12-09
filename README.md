# README.md

# Projet DBT : dbt_learning

Ce projet dbt contient des modèles pour **Carrefour (US)** et **Jaffle Shop (EU)**, organisés en **staging** et **mart**.
Il vous faudra adapter le profile.yml que voici et le champ schema des schempa.yml

---

## Arborescence du projet

```
dbt_learning/
│
├─ models/
│   ├─ staging/
│   │   ├─ carrefour/
│   │   └─ jaffle_shop/
│   └─ mart/
│       ├─ carrefour/
│       └─ jaffle_shop/
```

---

## Profils BigQuery

Fichier `profiles.yml` :

```yaml
dbt_learning:
  target: us   # target par défaut
  outputs:

    us:
      type: bigquery
      method: service-account
      project: berf-rzf-erg #your project gcp id
      dataset: dbt_intro #your dataset bq
      location: US
      keyfile: path/to/json.json # your path to credentials

    eu:
      type: bigquery
      method: service-account
      project: berf-rzf-erg #your project gcp id
      dataset: dbt_learning #your dataset bq
      location: EU
      keyfile: path/to/json.json # your path to credentials
```


---

## 2 Localisation Donc 2 Commandes d’exécution

### 1. Modèles Carrefour (US)

```bash
dbt run --target us --select staging.carrefour+
```

### 1. Modèles jaffle_shop (EU)

```bash
dbt run --target eu --select staging.jaffle_shop+
```

