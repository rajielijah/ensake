import 'package:ensake_loyalty_app/models/user.dart';
import 'package:ensake_loyalty_app/models/reward.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  static User getMockUser() {
    return User(
      id: 'YQG9FBVJBMU42',
      firstName: 'Genghis',
      lastName: 'Khan',
      email: 'ghengiskhan@gmail.com',
      phoneNumber: '08123456789',
      dialingCode: '234',
      countryCode: 'NG',
      token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  static List<Reward> getMockRewards() {
    return [
      Reward(
        id: 1,
        brand: Brand(
          id: 1,
          name: 'Circa',
          logo: 'https://i.postimg.cc/hzrWCmQj/Circa-Logo.png',
          address:
              '2 Kola Adeyina Close, Off Jerry Iriabe St, Lekki Phase I, Lagos 106104, Nigeria',
        ),
        points: 50,
        description: 'One bottle of Hennessy',
        claimed: false,
      ),
      Reward(
        id: 2,
        brand: Brand(
          id: 2,
          name: 'Cravvings',
          logo: 'https://i.postimg.cc/4HxCj3p1/Cravvings-Logo.png',
          address: '80 Ikosi Road, Ikosi Ketu, Lagos 105102, Lagos, Nigeria',
        ),
        points: 100,
        description: 'Free meal for 2',
        claimed: false,
      ),
      Reward(
        id: 3,
        brand: Brand(
          id: 3,
          name: 'Ibom Air',
          logo: 'https://i.postimg.cc/QV8rFfvW/Ibom-Air-Logo.png',
          address:
              'Transcorp Hilton, Floor 01, No 1 Aguiyi Ironsi Street, Maitama, FCT, Abuja',
        ),
        points: 280,
        description: 'A return ticket to Lagos',
        claimed: false,
      ),
      Reward(
        id: 4,
        brand: Brand(
          id: 4,
          name: 'Omenka',
          logo: 'https://i.postimg.cc/TphM9pdd/Omenka-Logo.png',
          address:
              '24 Modupe Alakija Cres, Ikoyi, Lagos 106104, Lagos, Nigeria',
        ),
        points: 190,
        description: 'Benin City Oil Painting - 5x5',
        claimed: false,
      ),
      Reward(
        id: 5,
        brand: Brand(
          id: 5,
          name: 'Total Energies',
          logo: 'https://i.postimg.cc/Z0wzprhs/Total-Nigeria-Logo.png',
          address:
              '1415e Adetokunbo Ademola Street, Victoria Island, Lagos 106104, Nigeria',
        ),
        points: 300,
        description: '3litres worth of fuel',
        claimed: false,
      ),
    ];
  }

  static Map<String, dynamic> getMockRewardsResponse() {
    return {
      'message': 'Rewards fetched successfully',
      'customer_points': 100,
      'rewards': getMockRewards().map((reward) => reward.toJson()).toList(),
    };
  }
}
