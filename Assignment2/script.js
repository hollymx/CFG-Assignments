//welcome title
const greeting = "Book your tickets!"
console.log(greeting)

//prompt for user to fill in
const response = prompt("Are you excited to go to the cinema?")

if (response === 'yes' || response === 'Yes') {
    alert('We cannot wait to see you!')
} else if (response === 'no' || response === 'No') {
    alert('You have come to the wrong place!')
} else {
    alert('Sorry what did you say?')
}


//discount alert
const randDiscount =Math.floor(Math.random() * 51);
alert(`This month we have ${randDiscount}% off of all cinema tickets! `)

//Code for formatting numbers as GBP
const formatter = new Intl.NumberFormat("en-GB", {
    style: "currency",
    currency: "GBP",
  });
  
  //Prices for each option
  const prices = {
    movies: [
      { movie: "Horror", price: 8 },
      { movie: "Romance", price: 8 },
      { movie: "Action", price: 8 },
      { movie: "Thriller", price: 8 },
    ],
    upgrades: [
      { upgrade: "Standard", price: 0 },
      { upgrade: "Recliner", price: 2 },
      { upgrade: "Premium", price: 4 },
    ],
    snacks: [
      { snack: "Popcorn", price: 4 },
      { snack: "Coke", price: 3 },
      { snack: "Sweets", price: 3 },
      { snack: "peanuts", price: 2 },
    ],
    deal: [
      { deal: false, price: 0 },
      { deal: true, price: 4 },
    ],
  };
  
  let selectedUpgrade = prices.upgrades.find(
    ({ upgrade }) => upgrade === "Recliner"
  );
  console.log(selectedUpgrade);
  
  const choices = {
    movie: null,
    upgrade: null,
    total: null,
    snacks: [{}],
    deal: false,
  };
  
  function selectOptions() {
    choices.movie = prices.movies.find(
      ({ movie }) => movie === document.getElementById("movie").value
    );
    choices.upgrade = prices.upgrades.find(
      ({ upgrade }) => upgrade === document.getElementById("upgrade").value
    );
    console.log(document.getElementById("upgrade").value);
    console.log(choices.movie.price);
    console.log(choices.upgrade.price);
    choices.total = Number(choices.movie.price) + Number(choices.upgrade.price);
  
    console.log(choices.total);
    orderSummary();
  }
  
  function orderSummary() {
    console.log(
      "Movie: " +
        formatter.format(choices.movie.price) +
        "\nUpgrade: " +
        formatter.format(choices.upgrade.price)
    );
  
    console.log("Total: " + choices.total);
  
    document.getElementById("movie-price").innerText = formatter.format(
      choices.movie.price
    );
    document.getElementById("upgrade-price").innerText = formatter.format(
      choices.upgrade.price
    );
    document.getElementById("total-price").innerText = formatter.format(
      choices.total
    );
    openForm();
  }
  
  function openForm() {
    document.getElementById("myForm").style.display = "block";
  }
  
  function closeForm() {
    document.getElementById("myForm").style.display = "none";
  }
  
  function addDeal() {
    choices.deal = prices.deal.find(({ deal }) => deal === true);
    document.getElementById("deal-price").innerText = formatter.format(
      choices.deal.price
    );
    choices.total =
      choices.movie.price + choices.upgrade.price + choices.deal.price;
    document.getElementById("total-price").innerText = formatter.format(
      choices.total
    );
  
    document.getElementById("deal").style.display = "inline";
    closeForm();
  }