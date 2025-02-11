import 'dart:async';
import 'dart:io';

class Theater {
  Theater() {
    String flagg = 'Y';
    do {
      print("\t\t\t\t\t\t\t==> Welcome To Our Theater <=== \n\n");
      print("Press 1 To Book New Seat :");
      print("Press 2 To Show The Theater Seats :");
      print("press 3 to Show User data :");
      print("press 4 to Exit :");
      int replay = int.parse(stdin.readLineSync()!);

      var seat = [
        ["E", "E", "E", "E", "E"],
        ["E", "E", "E", "E", "E"],
        ["E", "E", "E", "E", "E"],
        ["E", "E", "E", "E", "E"],
        ["E", "E", "E", "E", "E"],
      ];
      int? a;
      int? b;
      Map<String, Map<String, String>> bookingDetails = {};
      switch (replay) {
        case 1:
          {
            print(
                "To Book new Seat,Please Enter Your Name & Your phone Number");
            String name = stdin.readLineSync()!;
            String phone = stdin.readLineSync()!;
            for (int i = 0; i < 5; i++) {
              for (int j = 0; j < 5; j++) {
                if (seat[i][j] == "E") {
                  seat[i][j] = "B";
                  bookingDetails["${i + 1},${j + 1}"] = {
                    "name": name!,
                    "phone": phone!
                  };
                  a = i;
                  b = j;
                  break;
                }
              }
            }
            print(
                "your name is $name and yor Phone Number is $phone and Your Seat is $a R $b Col");
          }
        case 2:
          {
            for (var i in seat) {
              print(i);
            }
          }
        case 3:
          {
            if (bookingDetails.isEmpty) {
              print("\nNo bookings found.\n");
              return;
            }

            print("\nUsers Booking Details:");
            bookingDetails.forEach((seat, userData) {
              print("Seat $seat: ${userData["name"]} - ${userData["phone"]}");
            });
            print("");
          }

        case 4:
          {
            print("==> you Select The Exit Option <==");
            break;
          }
        default:
          print("You Enter Invaild Number You Have Number in range [0-4] '_'");
      }
      print("If You Want To Exit press(N/n)");
      flagg = stdin.readLineSync()!;
    } while (flagg != 'n' || flagg != 'N');
  }
}

void main() {
  Theater theater = Theater();
}
