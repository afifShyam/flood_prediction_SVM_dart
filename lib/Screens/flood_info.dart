import 'package:flutter/material.dart';

class FloodInfoPage extends StatefulWidget {
  const FloodInfoPage({Key? key}) : super(key: key);

  @override
  State<FloodInfoPage> createState() => _FloodInfoPageState();
}

class _FloodInfoPageState extends State<FloodInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flood Preparation Tips'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips for Flood Preparation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'BEFORE a Flood:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Find out if you live in a flood-prone area. If YES, then do everything on this checklist.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Develop an evacuation plan. Everyone in your family should know where to go if they have to leave. Trying to make plans at the last minute can be upsetting and create confusion.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Discuss floods with your family. Everyone should know what to do in case all family members are not together. Discussing floods ahead of time helps reduce fear and anxiety and lets everyone know how to respond.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Determine what to move up, out or away, and then do it: feed supplies, furniture, clothing, medical equipment/medicines, important family papers, jewellery, electronics, food, etc.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Use the safest routes to a predetermined place. Avoid roads that will probably be blocked by water.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6. Know how to turn off utilities, such as gas, electricity, and water.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '7. Tell friends and relatives where you will be in case of evacuation.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '8. Maintain a disaster supply kit at home. A kit will have (at minimum):\n'
              '   - First aid supplies\n'
              '   - Flashlight with extra batteries\n'
              '   - Non-perishable food\n'
              '   - Drinking water\n'
              '   - Candles, matches\n'
              '   - Essential medicines\n'
              '   - Warm clothes, Blanket(s) or sleeping bag(s)\n'
              '   - Cash\n'
              '   - Rain gear or a change of clothing',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '9. Make sure you have emergency supplies on hand that are stored in one or two containers that can be used if you stay, but also taken in case of evacuation.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '10. Set aside in clean, plastic containers one gallon of drinking water per person, per day for seven days.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '11. Teach children how and when to call 999, police, fire department, and show them which radio station to tune to for emergency information.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'If NO or if you\'ve already done the checklist, then help relatives, friends, neighbours and other people to do the checklist.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'DURING a Flood:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Listen to the radio or television or your Emergency Alerting Station for information.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Be aware that flash flooding can occur. If there is any possibility of a flash flood, move immediately to higher ground. Do not wait for instructions to move.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Adhere to any emergency orders of authorities.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Be aware of streams, drainage channels and other areas known to flood suddenly. Flash floods can occur in these areas with or without such typical warnings as rain clouds or heavy rain.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'If you must prepare to evacuate, you should do the following:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1. If advised to evacuate, do so immediately.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Evacuation is much simpler and safer before flood waters become too deep for ordinary vehicles to drive through.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Turn off all electric circuits at the fuse panel, gas and propane service at the meter or main entry, and water at the main valve, then LEAVE immediately.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Follow recommended evacuation routes—shortcuts may be blocked.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Leave early enough to avoid being marooned by flooded roads.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6. If you come to a flooded area, turn around and go another way.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '7. Do not drive through water or around barriers. A small car can be swept away in as little as one foot of water. Two feet of water will take away almost any other vehicle. A person can be knocked down by as little as six inches of rushing water.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '8. If your car stalls, abandon it immediately and move to higher ground.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Don\'t During Evacuation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Do not walk through moving water. Six inches of moving water can make you fall. If you have to walk in water, walk where the water is not moving. Use a stick to check the firmness of the ground in front of you.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Do not drive into flooded areas. If floodwaters rise around your car, abandon the car and move to higher ground if you can do so safely. You and the vehicle can be quickly swept away.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'What Would You Do: AFTER a Flood',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Listen to radio and TV latest announcements.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Do not return home unless advised by authorities.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Inspect your property before you enter, look for broken parts, cracks, and missing items.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Use a stick to move small items in your property, beware of dangerous insects.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Inspect your electric circuits, gas, and water sources before turning them on.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6. Inspect your septic tank.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '7. Remove all flood-affected foods and beverages.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '8. Help your neighbors and disabled.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '9. Alert local authorities on broken public amenities.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'How can the public help AFTER a disaster?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'When disaster strikes, people everywhere want to help those in need. To ensure that this compassion and generosity are put to good use, the media can highlight these facts:\n'
              '- Financial aid is an immediate need of disaster victims. Financial contributions should be made through a recognized voluntary organization to help ensure that contributions are put to their intended use.\n'
              '- Before donating food or clothing, wait for instructions from local officials. Immediately after a disaster, relief workers usually don\'t have the time or facilities to set up distribution channels, and too often these items go to waste.\n'
              '- Volunteers should go through a recognized voluntary agency. They know what is needed and are prepared to deal with the need.\n'
              '- Local emergency services officials also coordinate volunteer efforts for helping in disasters.\n'
              '- Organizations and community groups wishing to donate items should first contact local officials to find out what is needed and where to send it. Be prepared to deliver the items one place, tell officials when you\'ll be there, and provide for transportation, driver, and unloading.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
