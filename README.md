# Server with knife-zero

## 1. install knife-zero, with chef

```
$ bundle install
```

on windows, install Chef DK, and

```
$ chef gem install knife-zero
```


## 2. vagrant up

```
$ vagrant up knife
```


## 3. knife zero bootstrapping

```
$ bundle exec knife zero bootstrap vagrant@192.168.33.101 --ssh-identity-file .vagrant/machines/knife/virtualbox/private_key
```

on windows,

```
$ chef exec knife zero bootstrap ...(same as above)
```


## 4. add recipes in run_list


## 5. run knife-zero converge
