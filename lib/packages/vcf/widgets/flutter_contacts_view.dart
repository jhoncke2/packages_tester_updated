import 'package:flutter/material.dart';
import 'package:flutter_contacts/config.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
class FlutterContactsView extends StatelessWidget {
  const FlutterContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contact = _getContact(context);
    return Center(
      child: Column(
        children: [
          Text(
            '${contact.name.first} ${contact.name.last}'
          ),
          Text(
            contact.addresses.first.address
          ),
          Text(
            contact.emails.first.address
          ),
          Text(
            contact.toVCard()
          )
        ],
      ),
    );
  }

  Contact _getContact(BuildContext context){
    FlutterContacts.config.vCardVersion = VCardVersion.v4;
    final initContact = Contact();
    initContact.name = Name(
      first: 'John',
      last: 'Wick'
    );
    initContact.notes.add(Note('Those are some notes for the contact'));
    initContact.addresses.add(Address(
      'Cra 2 # 13 - 2',
      label: AddressLabel.home
    ));
    initContact.addresses.add(Address(
      '82 Beaver St, New York, NY 10005, Estados Unidos',
      label: AddressLabel.work,
      street: 'The Street',
      pobox: 'The Pobox',
      neighborhood: 'The Neighborhood',
      city: 'New York',
      state: 'New York',
      postalCode: '234',
      country: 'United States',
      isoCountry: 'UE',
      subAdminArea: 'North America',
      subLocality: 'America'
    ));
    initContact.emails.add(Email(
      'mrw@email.com',
      label: EmailLabel.home
    ));
    initContact.emails.add(Email(
      'continental@email.com',
      label: EmailLabel.work
    ));
    initContact.phones.add(Phone(
      '1234232534',
      label: PhoneLabel.car
    ));
    initContact.phones.add(Phone(
      '1591234546',
      label: PhoneLabel.work
    ));
    String stringCard = initContact.toVCard();
    final lines = stringCard.split('\n');
    final endIndex = lines.indexWhere(
      (line) => line.contains('END:')
    );
    if(endIndex != -1){
      lines.insert(endIndex-1, 'GEO:39.95;-75.1667');
    }
    print(stringCard.characters.length);
    for(final line in stringCard.split('\n')){
      print('a new line');
    }
    stringCard = lines.join('\n');
    print(stringCard);
    return Contact.fromVCard(stringCard);
  }
}