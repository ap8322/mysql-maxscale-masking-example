## setup
```
docker-compose up -d
```

## config file
```
maxscale.cnf.d
├── example.cnf
└── masking_rules.json
```

## access mysql
```
docker-compose exec mysql mysql -umaxuser -pmaxpwd -h localhost test
```

## access mysql via maxscale
```
docker-compose exec mysql mysql -umaxuser -pmaxpwd -h maxscale test -P 4008
```

## masking check
```
% docker-compose exec mysql mysql -umaxuser -pmaxpwd -h localhost test -e "select * from masking1;"
Warning: Using a password on the command line interface can be insecure.
+---------------------+
| card_number1        |
+---------------------+
| 1234-5678-9012-3456 |
| 1234-5678-9013-3456 |
| 1234-5678-9014-3456 |
+---------------------+

% docker-compose exec mysql mysql -umaxuser -pmaxpwd -h maxscale test -P 4008 -e "select * from masking1;"
Warning: Using a password on the command line interface can be insecure.
+---------------------+
| card_number1        |
+---------------------+
| ******************* |
| ******************* |
| ******************* |
+---------------------+
```
