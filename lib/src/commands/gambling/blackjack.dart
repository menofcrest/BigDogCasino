import 'dart:math';
import 'package:erebus/command.dart';
import '../../../casino.dart';

class BlackJackCommand extends Command {
  final names = ['blackjack', '21'];
  final args = [Argument('bet')];
  final UserService userService;
  final random = Random();

  BlackJackCommand(this.userService);

  Future<void> execute(context, args) async {
    final bet = await args['bet'].resolve(Resolver.integer(min: 1));
    final account = await userService.getAccount(context.message.author.id);
    final dealerHand = (new Random().nextInt(20) + 1);
    final userHand = (new Random().nextInt(20) + 1);

    if (bet > account.balance) {
      await context
          .respond((message) => message..content = 'You don\'t have enough 🐶!')
          .send();
      return;

    if (userHand == 21){
      await context
      .respond((message) => message..content = '🎊🎊BlackJack!🎊🎊 You won 🐶$bet')
      .send();
      }
    if (dealerHand == 21){
      await context
      .respond((message) => message..content = 'Dealer has BlackJack, you lost 🐶$bet')
      .send();
    }
    }
  }
}
