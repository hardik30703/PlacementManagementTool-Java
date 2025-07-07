package com.example.MCompProject.Service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@Service
public class GeocodingService {

    private static final String NOMINATIM_API_URL = "https://nominatim.openstreetmap.org/search";

    public String getCityFromPostcode(String postcode) {
        RestTemplate restTemplate = new RestTemplate();
        URI uri = UriComponentsBuilder.fromHttpUrl(NOMINATIM_API_URL)
                .queryParam("postalcode", postcode)
                .queryParam("format", "json")
                .queryParam("addressdetails", 1)
                .build()
                .toUri();

        NominatimResponse[] response = restTemplate.getForObject(uri, NominatimResponse[].class);

        if (response != null && response.length > 0) {
            return response[0].getAddress().getCity();
        }
        return null;
    }

    // Inner classes to map the JSON response from the Nominatim API
    public static class NominatimResponse {
        private Address address;

        public Address getAddress() {
            return address;
        }

        public void setAddress(Address address) {
            this.address = address;
        }

        public static class Address {
            private String city;

            public String getCity() {
                return city;
            }

            public void setCity(String city) {
                this.city = city;
            }
        }
    }
}
