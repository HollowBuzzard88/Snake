#include <iostream>
#include <cmath>

#include "SFML.h"

int main()
{
    /*------------Window-----------*/
    sf::RenderWindow window(sf::VideoMode({100, 100}), "Snake", sf::Style::Titlebar | sf::Style::Resize | sf::Style::Close);
    window.setVerticalSyncEnabled(false);

    /*------------Setup------------*/

    /*----------Game Loop----------*/
    while (window.isOpen())
    {
        // Event polling
        while (const std::optional event = window.pollEvent())
        {
            if (event->is<sf::Event::Closed>())
            {
                window.close();
            }
            else if (const auto* keyPressed = event->getIf<sf::Event::KeyPressed>())
            {
                if (keyPressed->scancode == sf::Keyboard::Scancode::Escape)
                {
                    window.close();
                }
            }

            if (const auto* resized = event->getIf<sf::Event::Resized>())
            {
                sf::FloatRect visibleArea({0.0f, 0.0f}, {static_cast<float>(resized->size.x), static_cast<float>(resized->size.y)});
                window.setView(sf::View(visibleArea));
            }
        }

        // Update

        // Render
        window.clear(sf::Color(34.0f, 34.0f, 34.0f));

        // Draw

        window.display();
    }

    /*------End of Application------*/

    return 0;
}
