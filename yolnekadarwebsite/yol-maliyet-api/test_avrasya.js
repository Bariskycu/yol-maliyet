const axios = require('axios');

async function test() {
    try {
        const response = await axios.post('http://localhost:3000/api/calculate', {
            from: "Beşiktaş, Istanbul",
            to: "Bornova, Izmir",
            vehicleType: "car",
            fuelConsumption: 6.5,
            fuelType: "benzin"
        });
        const data = response.data.data;
        const route = data.routes[0];
        console.log('--- TEST RESULTS ---');
        console.log(`From: ${data.from} -> To: ${data.to}`);
        console.log(`Tolls: ${route.tolls.map(t => t.name).join(', ')}`);
        console.log(`Toll Cost: ${route.tollCost} TL`);
        console.log('--------------------');
    } catch (error) {
        console.error('Error:', error.message);
        if (error.response) console.error('Response:', error.response.data);
    }
}

test();
