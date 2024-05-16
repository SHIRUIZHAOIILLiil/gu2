# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Admin(models.Model):
    idadmin = models.AutoField(primary_key=True)
    admin_no = models.CharField(max_length=45)
    password = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'admin'


class Site(models.Model):
    idsite = models.AutoField(primary_key=True)
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='iduser')
    address = models.CharField(max_length=100)
    street = models.CharField(max_length=100)
    status = models.CharField(max_length=20)
    idadmin = models.ForeignKey(Admin, models.DO_NOTHING, db_column='idadmin')
    path = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'site'


class Us(models.Model):
    idus = models.AutoField(primary_key=True)
    idsite = models.ForeignKey(Site, models.DO_NOTHING, db_column='idsite')
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='iduser')
    e_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'us'


class User(models.Model):
    iduser = models.AutoField(primary_key=True)
    phone = models.CharField(max_length=11)
    name = models.CharField(max_length=50)
    password = models.CharField(max_length=200)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'user'


class Site_Ad(models.Model):
    idSA = models.AutoField(primary_key=True)
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='iduser')
    address = models.CharField(max_length=100)
    street = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'site_ad'
