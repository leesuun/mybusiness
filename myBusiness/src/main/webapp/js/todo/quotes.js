const quotes = [
	{
		quote: "It is in the moment of decisions that your destiny is shaped.",
		author: "- Anthony Robbins -",
	},
	{
		quote: "Life is a journey, not a guided tour.",
		author: "- Anonymous -",
	},
	{
		quote: "Always do what you are afraid to do.",
		author: "- Ralph Waldo Emerson  -",
	},
	{
		quote: "You create your opportunities by asking for them.",
		author: "- 패티 한센 -",
	},
	{
		quote: "Life is either a daring adventure or nothing!",
		author: "- Helen Keller -",
	},
	{
		quote: "Men are not prisoners of fate, but only prisoners of their own minds.",
		author: "- Franklin Delano Roosevelt -",
	},
	{
		quote: "When you have faults, do not fear to abandon them.",
		author: "- Confucius -",
	},
	{
		quote: "Never confuse a single defeat with a final defeat.",
		author: "- F.Scott Fitzgerald -",
	},
	{
		quote: "한 번도 실수한 적이 없는 사람은 한 번도 새로운 것에 도전해 본 적이 없는 사람이다.",
		author: "- 알버트 아인슈타인 -",
	},
	{
		quote: "허물이 있다면, 버리기를 두려워 말라 : 過則勿憚改(과즉물탄개)",
		author: "- 공자 -",
	},
];

const quote = document.querySelector("#quotes");
const author = document.querySelector("#author");
const QUOTE_INTERVAL = 5000; 

setInterval(() => {
	const todaysQuote = quotes[Math.floor(Math.random() * quotes.length)];
	quote.innerText = todaysQuote.quote;
	author.innerText = todaysQuote.author;
}, QUOTE_INTERVAL)


