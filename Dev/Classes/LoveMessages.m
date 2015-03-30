//
//  LoveMessages.m
//  Baci01
//

#import "LoveMessages.h"
#include <stdlib.h>

@implementation LoveMessages

@synthesize messages;
@synthesize messagesItalian;
@synthesize currentMessageNumber;

-(void)RandomizeFirstMessage
{
	srandomdev();
	currentMessageNumber = random() % [messages count];
}

-(id)init
{	
	messages = [[NSMutableArray array] retain];
	messagesItalian = [[NSMutableArray array] retain];
	
	// English version
	[messages addObject:@"\"A kiss is a secret told to the mouth instead of the ear.\" ::E.Rostand::37"];
	[messages addObject:@"\"A kiss, when all is said, what is it? 'Tis a secret told to the mouth.\" ::E.Rostand::38"];
	[messages addObject:@"\"The sound of a kiss is not so loud as that of a cannon, but its echo lasts a great deal longer.\" ::O.W.Holmes::39"];
	[messages addObject:@"\"Kisses kept are wasted; Love is to be tasted.\" ::E.Vance Cooke::40"];
	[messages addObject:@"\"A kiss speaks of future pleasures, and he too would seem to say: this is my promise.\" ::B.Guarini::41"];
	[messages addObject:@"\"A sponge to wipe away the past, a rose to sweeten the present, a kiss to greet the future.\" ::G.Maupassant::44"];
	[messages addObject:@"\"A kiss strikes like lightning; love passes like a storm.\" ::Proverbio arabo/Arab Proverb::45"];
	[messages addObject:@"\"Words of love are always the same, they take on the flavour of the lips that utter them.\" ::G.Maupassant::46"];
	[messages addObject:@"\"Friends are those rare people who ask how you are and then wait to hear the answer.\" ::Anonimo/Anonomous::55"];
	[messages addObject:@"\"To get the full value of joy you must have someone to share it with.\" ::M.Twain::58"];
	[messages addObject:@"\"We do not so much need the help of friends as the certainty of their help.\" ::Epicuro::59"];
	[messages addObject:@"\"One of the benefits of friendship is knowing to whom you may confide a secret.\" ::A.Manzoni::60"];
	[messages addObject:@"\"The most praiseworthy deeds are those that remain hidden.\" ::B.Pascal::61"];
	[messages addObject:@"\"A friend to all is a friend of none.\" ::A.Schopenhauer::62"];
	[messages addObject:@"\"Love all, trust a few, do wrong to none.\" ::W.Shakespeare::63"];
	[messages addObject:@"\"A friend in need is a friend indeed.\" ::B.Graciàn::64"];
	[messages addObject:@"\"You can judge a man by his friends.\" ::G.Flaubert::65"];
	[messages addObject:@"\"The heart cannot be bought or sold but only given.\" ::Proverbio/Proverb::66"];
	[messages addObject:@"\"A true friend knows all there is to know about you yet still likes you.\" ::E.Hubbard::68"];
	[messages addObject:@"\"Friendship is Love without his wings!\" ::G.Byron::69"];
	[messages addObject:@"\"How you give is more important than what you give.\" ::P.Corneille::70"];
	[messages addObject:@"\"Rare though true love may be, it is less rare than true friendship.\" ::F.Rochefoucauld::71"];
	[messages addObject:@"\"Day by day and night by night we were together-all else has long been forgotten by me.\" ::W.Whitman::76"];
	[messages addObject:@"\"Grow old along with me, the best is yet to be.\" ::G.Sand::83"];
	[messages addObject:@"\"Led by your scent to fairer climes at last.\" ::C.Baudelaire::86"];
	[messages addObject:@"\"Whether you come from heaven or hell, what does it matter, O Beauty!\" ::C.Baudelaire::87"];
	[messages addObject:@"\"The more I love you the more you flee from me my darling.\" ::C.Baudelaire::88"];
	[messages addObject:@"\"Come, lay thy head upon my breast, And I will kiss thee into rest.\" ::G.Byron::89"];
	[messages addObject:@"\"I loved you at first sight. And you smile because you know it.\" ::A.Boito::90"];
	[messages addObject:@"\"Launch you heart before you and run after it.\" ::Proverbio Arabo::100"];
	
	[messages addObject:@"\"In women everything is heart, even the head.\" ::J.P.Richter::101"];
	[messages addObject:@"\"Marriage is distinctly and repeatedly excluded from heaven. Is this because it is thought likely to mar the general felicity?\" ::S.Butler::102"];
	[messages addObject:@"\"Given the right chance women are capable of anything.\" ::O.Wilde::103"];
	[messages addObject:@"\"Never trust a woman who tells you her real age; a woman who tells you that would tell you anything.\" ::O.Wilde::104"];
	[messages addObject:@"\"Women are meant to be loved, not to be understood.\" ::O.Wilde::105"];
	[messages addObject:@"\"Hell hath no fury like a woman scorned.\" ::W.Shakespeare::106"];
	[messages addObject:@"\"If God had not created woman, he would not have created flowers.\" ::V.Hugo::107"];
	[messages addObject:@"\"The woman does not exist of whose beauty all men shall agree upon.\" ::G.Leopardi::108"];
	[messages addObject:@"\"Being a woman is a terribly difficult task since it consists principally in dealing with men.\" ::Conrad::109"];
	[messages addObject:@"\"A man enjoys the happiness he feels, a woman the happiness she gives.\" ::P.C.De Laclos::110"];
	[messages addObject:@"\"When writing of women the pen should be dipped in a rainbow.\" ::D.Dederot::111"];
	[messages addObject:@"\"Some women love their husbands so much that to avoid wearing them out they take their friends' husbands.\" ::A.Dumas padre::112"];
	[messages addObject:@"\"By all means marry. If you get a good wife you will become happy, and if you get a bad one you will become a philosopher.\" ::Socrate::113"];
	[messages addObject:@"\"Ask a toad what beauty is and he will answer you that it is his toad wife.\" ::Voltaire::114"];
	[messages addObject:@"\"Bigamy is having one wife too many. Monogamy is the same.\" ::O.Wilde::115"];
	[messages addObject:@"\"A man can be happy with any woman as long as he does not love her.\" ::O.Wilde::116"];
	[messages addObject:@"\"The ideal husband is unmarried.\" ::O.Wilde::117"];
	[messages addObject:@"\"For every woman their is a seducer. Her happiness lies in her meeting him.\" ::S.Kierkegaard::118"];
	[messages addObject:@"Woman:\"You don't understand me\" Man:\"What do you mean?\" ::O.Wilde::119"];
	[messages addObject:@"\"Judge not thy woman; the more you judge her the less you love her.\" ::Chinese Proverb::120"];
	[messages addObject:@"\"Women are like kites. The more you let out the cord the better your grip on them.\" ::A.Dumas Figlio::121"];
	[messages addObject:@"\"Being a husband is a whole-time job.\" ::A.Bennet::122"];
	[messages addObject:@"\"There are two things I have always loved to folly; women and bachelorhood.\" ::N.De Chamfort::123"];
	[messages addObject:@"\"So heavy is the bond of marriage that it takes two, and often three, to bear it.\" ::A.Dumas padre::124"];
	[messages addObject:@"\"Only men who are not interested in women are interested in their clothes.\" ::A.France::125"];
	[messages addObject:@"\"Where love is concerned, too much is not even enough.\" ::Beaumarchais::127"];
	[messages addObject:@"\"Love can hope where reason would despair.\" ::Lyttleton::131"];
	[messages addObject:@"\"He who gives immediately gives twice.\" ::Proverbio/Proverb::134"];
	[messages addObject:@"\"Love is the pastime of the leisurely and the leisure of the active.\" ::E.Bulwer-Lytton::135"];
	[messages addObject:@"\"Those whose love burns dare not; the love of those who dare burns not.\" ::N.Tommaseo::136"];
	[messages addObject:@"\"That Love is all there is, Is all we know of Love.\" ::E.Dickinson::137"];
	[messages addObject:@"\"Loved shall be who lovable becomes.\" ::Proverbio/Proverb::138"];
	[messages addObject:@"\"Without Bacchus and Ceres, love is enfeebled and weary.\" ::Proverbio/Proverb::139"];
	[messages addObject:@"\"We know the least about those we love the most.\" ::Proverbio cinese/Chinese Proverb::140"];
	[messages addObject:@"\"When the arrow is primed on the bow sooner or later it must be unleashed.\" ::Proverbio cinese/Chinese Proverb::141"];
	[messages addObject:@"\"The longer the cord the higher the kite flies.\" ::Proverbio francese/French Proverb::142"];
	[messages addObject:@"\"Lovers can live on kisses and fresh water.\" ::Proverbio inglese/English Proverb::143"];
	
	
	// Italian version
	[messagesItalian addObject:@"\"Il Bacio è un segreto sussurrato a una bocca anzichè ad un orecchio\" ::E.Rostand::37"];
	[messagesItalian addObject:@"\"E che cos'è un bacio? Un segreto detto sulla bocca\" ::E.Rostand::38"];
	[messagesItalian addObject:@"\"Il rumore di un bacio non è forte come quello di un cannone, ma il suo eco dura molto più a lungo\" ::O.W.Holmes::39"];
	[messagesItalian addObject:@"\"Bacio non dato è bacio sprecato; l'amore dev'essere assaggiato\" ::E.Vance Cooke::40"];
	[messagesItalian addObject:@"\"Il Bacio è segno di futuro diletto, e par che dica anch'egli: io ti prometto\" ::B.Guarini::41"];
	[messagesItalian addObject:@"\"Una spugna per cancellare il passato, una rosa per addolcire il presente e un bacio per salutare il futuro\" ::G.Maupassant::44"];
	[messagesItalian addObject:@"\"Il bacio colpisce come la folgore, l'amore passa come un temporale\" ::Proverbio arabo/Arab Proverb::45"];
	[messagesItalian addObject:@"\"Le parole d'amore, sono sempre le stesse,  prendono il sapore delle labbra da cui escono.\" ::G.Maupassant::46"];
	[messagesItalian addObject:@"\"Gli amici sono quelle rare persone che ti chiedono come stai e poi ascoltano persino la risposta.\" ::(Anonimo)/Anonomous::55"];
	[messagesItalian addObject:@"\"Per cogliere tutto il valore della gioia devi avere qualcuno con cui condividerla\" ::M.Twain::58"];
	[messagesItalian addObject:@"\"Non abbiamo tanto bisogno dell'aiuto degli amici, quanto della certezza del loro aiuto\" ::Epicuro::59"];
	[messagesItalian addObject:@"\"Uno dei benefici dell'amicizia è di sapere a chi confidare un segreto\" ::A.Manzoni::60"];
	[messagesItalian addObject:@"\"Le belle azioni nascoste sono le più stimabili\" ::B.Pascal::61"];
	[messagesItalian addObject:@"\"Chi è amico di tutti non è amico di nessuno\" ::A.Schopenhauer::62"];
	[messagesItalian addObject:@"\"Ama tutti, credi a pochi e non far del male a nessuno\" ::W.Shakespeare::63"];
	[messagesItalian addObject:@"\"L'amico certo si conosce nell'incerto\" ::W.Shakespeare::64"];
	[messagesItalian addObject:@"\"Ciascuno mostra quello che è dagli amici che ha\" ::G.Flaubert::65"];
	[messagesItalian addObject:@"\"Il cuore è una ricchezza che non si vende, non si compra, ma si regala\" ::Proverbio/Proverb::66"];
	[messagesItalian addObject:@"\"L'amico è uno che sa tutto di te e nonostante questo gli piaci\" ::E.Hubbard::68"];
	[messagesItalian addObject:@"\"L'amicizia è amore senza le sue ali\" ::G.Byron::69"];
	[messagesItalian addObject:@"\"La maniera di dare val di più di ciò che si dà\" ::P.Corneille::70"];
	[messagesItalian addObject:@"\"Per raro che sia il vero amore, è meno raro della vera amicizia\" ::F.Rochefoucauld::71"];
	[messagesItalian addObject:@"\"Eravamo insieme, tutto il resto del tempo l'ho scordato.\" ::W.Whitman::76"];
	[messagesItalian addObject:@"\"Invecchia insieme a me, il meglio deve ancora venire.\" ::G.Sand::83"];
	[messagesItalian addObject:@"\"Guidato dal tuo profumo verso climi che incantano\" ::C.Baudelaire::86"];
	[messagesItalian addObject:@"\"Vieni tu dal cielo profondo o sorgi dall'abisso, Bellezza?\" ::C.Baudelaire::87"];
	[messagesItalian addObject:@"\"Tanto più t'amo quanto più mi fuggi, o bella\" ::C.Baudelaire::88"];
	[messagesItalian addObject:@"\"Vieni, posa la testa sul mio petto e io t'acqueterò con baci e baci\" ::C.Baudelaire::89"];
	[messagesItalian addObject:@"\"Come ti vidi m'innamorai. E tu sorridi perchè lo sai\" ::C.Baudelaire::90"];
	[messagesItalian addObject:@"\"Lancia il tuo cuore davanti a te, e corri a raggiungerlo\" ::C.Baudelaire::100"];
	[messagesItalian addObject:@"\"Nelle donne ogni cosa è cuore, anche la testa\" ::C.Baudelaire::101"];
	[messagesItalian addObject:@"\"Nel paradiso non esiste il matrimonio; evidentemente per non turbare la serenità del luogo\" ::C.Baudelaire::102"];
	[messagesItalian addObject:@"\"Fornite alle donne occasioni adeguate e le donne potranno fare tutto\" ::C.Baudelaire::103"];
	[messagesItalian addObject:@"\"Diffida di una donna che dice la sua vera età, una donna cosi' è capace di tutto\" ::C.Baudelaire::104"];
	[messagesItalian addObject:@"\"Le donne sono fatte per essere amate non per essere comprese\" ::C.Baudelaire::105"];
	[messagesItalian addObject:@"\"L'inferno non è mai tanto scatenato quanto una donna offesa\" ::C.Baudelaire::106"];
	[messagesItalian addObject:@"\"Se Dio non avesse fatto la donna, non avrebbe fatto il fiore\" ::C.Baudelaire::107"];
	[messagesItalian addObject:@"\"Non si troverà una sola donna della cui bellezza o bruttezza tutti gli uomini convengano\" ::C.Baudelaire::108"];
	[messagesItalian addObject:@"\"Essere donna è un compito difficile: consiste nell'avere a che fare con gli uomini\" ::C.Baudelaire::109"];
	[messagesItalian addObject:@"\"L'uomo gode della felicità che prova, la donna di quella che dà\" ::C.Baudelaire::110"];
	[messagesItalian addObject:@"\"Quando si scrive delle donne, bisogna intingere la penna nell'arcobaleno\" ::C.Baudelaire::111"];
	[messagesItalian addObject:@"\"Certe donne amano talmente il proprio marito che per non sciuparlo prendono quello delle loro amiche\" ::C.Baudelaire::112"];
	[messagesItalian addObject:@"\"Spòsati: se trovi una buona moglie sarai felice; se ne trovi una cattiva, diventerai filosofo\" ::C.Baudelaire::113"];
	[messagesItalian addObject:@"\"Chiedete al rospo che cosa sia la bellezza e vi risponderà che è la femmina del rospo\" ::C.Baudelaire::114"];
	[messagesItalian addObject:@"\"La bigamia è avere una moglie di troppo. La monogamia lo stesso\" ::C.Baudelaire::115"];
	[messagesItalian addObject:@"\"Un uomo può essere felice con qualunque donna a patto che non ne sia innamorato\" ::C.Baudelaire::116"];
	[messagesItalian addObject:@"\"Il marito ideale rimane celibe\" ::C.Baudelaire::117"];
	[messagesItalian addObject:@"\"A ogni donna corrisponde un seduttore. La sua felicità sta nell'incontrarlo\" ::C.Baudelaire::118"];
	[messagesItalian addObject:@"\"Tu non mi capisci\". Lui:\"Cosa intendi dire?\" ::C.Baudelaire::119"];
	[messagesItalian addObject:@"\"Non giudicare la tua donna, più la giudichi meno l'ami\" ::C.Baudelaire::120"];
	[messagesItalian addObject:@"\"Le donne sono come gli aquiloni: più gli si da corda e meglio si tengono\" ::C.Baudelaire::121"];
	[messagesItalian addObject:@"\"Fare il marito è un lavoro a tempo pieno\" ::C.Baudelaire::122"];
	[messagesItalian addObject:@"\"Ci sono due cose che ho sempre amato alla follia: le donne ed il celibato\" ::C.Baudelaire::123"];
	[messagesItalian addObject:@"\"Il legame del matrimonio è cosi' pesante che si deve essere in due per portarlo, spesso in tre\" ::C.Baudelaire::124"];
	[messagesItalian addObject:@"\"Solo gli uomini che non sono interessati alle donne sono interessati ai loro vestiti\" ::C.Baudelaire::125"];
	[messagesItalian addObject:@"\"In amore troppo è ancora poco\" ::C.Baudelaire::127"];
	[messagesItalian addObject:@"\"L'amore sa sperare quando la ragione già dispera\" ::C.Baudelaire::131"];
	[messagesItalian addObject:@"\"Dà due volte chi dà subito\" ::C.Baudelaire::134"];
	[messagesItalian addObject:@"\"L'amore è l'attività degli oziosi e l'ozio degli attivi\" ::C.Baudelaire::135"];
	[messagesItalian addObject:@"\"In amore chi arde non ardisce e chi ardisce non arde\" ::C.Baudelaire::136"];
	[messagesItalian addObject:@"\"Che l'amore è tutto, è tutto ciò che sappiamo sull'amore\" ::C.Baudelaire::137"];
	[messagesItalian addObject:@"\"Chi vuol farsi amare, amabile deve diventare\" ::C.Baudelaire::138"];
	[messagesItalian addObject:@"\"Senza Cerere e Bacco è l'amor debole e fiacco\" ::C.Baudelaire::139"];
	[messagesItalian addObject:@"\"A chi più amiamo, meno dire sappiamo\" ::C.Baudelaire::140"];
	[messagesItalian addObject:@"\"Quando una freccia è incoccata sull'arco, prima o poi bisogna scoccarla\" ::C.Baudelaire::141"];
	[messagesItalian addObject:@"\"Se la corda è lunga l'aquilone volerà in alto\" ::C.Baudelaire::142"];
	[messagesItalian addObject:@"\"Gli innamorati possono vivere di baci e acqua fresca\" ::C.Baudelaire::143"];
	
	[self RandomizeFirstMessage];
	
	return self;
}

-(struct aMessage)getTheMessage
{	 
	NSArray *splitEnglish = [[messages objectAtIndex:currentMessageNumber] componentsSeparatedByString:@"::"];
	NSArray *splitItalian = [[messagesItalian objectAtIndex:currentMessageNumber] componentsSeparatedByString:@"::"];
	
	struct aMessage result;
	result.message = [splitEnglish objectAtIndex:0];
	result.messageItalian = [splitItalian objectAtIndex:0];
	result.author = [splitEnglish objectAtIndex:1];
	result.number = [splitEnglish objectAtIndex:2];
	
	return result;
}

-(void)moveNext
{
	currentMessageNumber += 1;
	
	if(currentMessageNumber > [self totalMessages])
		currentMessageNumber = 0;
	
}

-(void)movePrevious
{
	currentMessageNumber -= 1;
	
	if(currentMessageNumber < 0)
		currentMessageNumber = [self totalMessages];
	
}

-(int)totalMessages
{
	return ([messages count] - 1);
}

@end
