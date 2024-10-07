#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

class Airport
{
public:
    int id;
    std::string airport;
    std::string code;
    std::string state;
    int regPer;
};

template <typename T>//list auslagern
class List
{
public:
    struct Node  // Define a Node structure for the linked list
    {
        T data;       // Data of the node
        Node *next;   // Pointer to the next node
    };

    Node *head; // Pointer to the head of the list

    List() : head(nullptr) {} // Constructor initializes head to nullptr

    void add(const T &item)
    {
        Node *new_node = new Node(); // Create a new node
        new_node->data = item;        // Set the data
        new_node->next = head;        // Point next to the current head
        head = new_node;              // Update head to the new node
    }

    
};

int main()
{

    Airport *airports[50]; // Array of pointers to Airport objects
    int i = 0;

    std::ifstream file("airports.csv"); // Open the file
    std::string line;

    // Check if the file was opened successfully
    if (!file.is_open())
    {
        std::cerr << "Could not open the file!" << std::endl;
        return 1;
    }

    // Skip the header line
    std::getline(file, line);

    // Read and process the file line by line
    while (std::getline(file, line))
    {
        std::stringstream lineStream(line); // Create a string stream for each line

        std::string id_str, airport_str, state_str, code_str, regPer_str;

        // Create a new Airport object
        Airport *ap = new Airport();

        // Extract each value from the line and assign it to the Airport object
        std::getline(lineStream, id_str, ',');
        std::getline(lineStream, airport_str, ',');
        std::getline(lineStream, state_str, ',');
        std::getline(lineStream, code_str, ',');
        std::getline(lineStream, regPer_str, ',');

        // Convert strings to appropriate types and assign
        ap->id = std::stoi(id_str); // Convert string to integer for ID
        ap->airport = airport_str;
        ap->state = state_str;
        ap->code = code_str;
        ap->regPer = std::stoi(regPer_str); // Convert string to integer for regional percentage

        // Store the Airport object in the array
        airports[i] = ap;

        // Increment index
        i++;
    }

    file.close(); // Close the file after processing

    // Example: Print out the details of the first airport to verify

    /*for (int j = 0; j < i; ++j)
    {
        std::cout << "Airport " << airports[j]->id << ": "
                  << airports[j]->airport << ", "
                  << airports[j]->state << " ("
                  << airports[j]->code << "), Regional Percentage: "
                  << airports[j]->regPer << "%" << std::endl;
    }*/

    List<int> *head = nullptr;

    // Create nodes and link them
    // Linking nodes
    head = first;
    first->next = second;
    second->next = third;

    List<std::string> *arrOfDests[50];

    List<std::string> *dest;
    dest->add("ATL");
    dest->add("SFO");

    arrOfDests[0] = dest;
    std::cout << "first in the list" << arrOfDests[0];

    return 0;
}
