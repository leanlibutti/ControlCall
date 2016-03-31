#usuarios#
admin = User.create!(
    id: '1',
    name:"admin",
    email:"admin@admin.com",
    admin: true,
    password: "administrador",
    password_confirmation: "administrador",
    password_security: "seguridad",
    )

user1 = User.create!(
    id: '2',
    name:"leandro",
    email:"leandro@gmail.com",
    sector_id:'1',
    internal: '1',
    admin: false,
    password: "12345678",
    password_confirmation: "12345678",
    password_security: "seguridad",
    )

user2 = User.create!(
    id: '3',
    name:"leandro",
    email:"leanlibutti@gmail.com",
    sector_id:'1',
    internal: '2',
    admin: false,
    password: "12345678",
    password_confirmation: "12345678",
    password_security: "seguridad",
    )

#areas#
c1 = Area.create(
    id:'1',
    name: "Informatica",
    )
c2 = Area.create(
    id:'2',
    name: "Limpieza",
    )

#sectores#
c1 = Sector.create(
    id:'1',
    area_id:'1',
    name: "Computadoras",
    )
c1 = Sector.create(
    id:'2',
    area_id:'2',
    name: "Barrido",
    )

#proveedores#

p1= Proveedor.create(
    id: '1',
    name: "telefonica",
    )

p1= Proveedor.create(
    id: '2',
    name: "telecom",
    )

#llamadas#

c1 = Call.create(
    id: '1',
    incoming: true,
    extension: "pepe",
    dial_number: "jjjn2e232j3e",
    ring: '40',
    acc_code: '203',
    cd: "33210",
    cost: '12.3',
    co: '12',
    destiny: "internacional",
    cell: false,
    proveedor_id: '2',
    user_id: '2',
    )


c2 = Call.create(
    id: '2',
    incoming: false,
    extension: "no es entrante",
    dial_number: "jjjn2e232j3e",
    ring: '40',
    acc_code: '203',
    cd: "33210",
    cost: '12.3',
    co: '12',
    destiny: "internacional",
    cell: false,
    proveedor_id: '1',
    user_id: '2',
    )

c3 = Call.create(
    id: '3',
    incoming: true,
    extension: "pepe",
    dial_number: "jjjn2e232j3e",
    ring: '40',
    acc_code: '203',
    cd: "33210",
    cost: '12.3',
    co: '12',
    destiny: "celular",
    cell: false,
    proveedor_id: '1',
    user_id: '1',
    )

c4 = Call.create(
    id: '4',
    incoming: false,
    extension: "no es entrante",
    dial_number: "jjjn2e232j3e",
    ring: '50',
    acc_code: '2',
    cd: "33210",
    cost: '21.3',
    co: '12',
    destiny: "nacional",
    cell: false,
    proveedor_id: '1',
    user_id: '2',
    )




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
