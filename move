#include <SFML/Graphics.hpp>

int main()
{
    sf::RenderWindow window(sf::VideoMode(1280,720), "SFML works!"); // 윈도우 창 열기
    window.setFramerateLimit(60);
    
    sf::RectangleShape rect; //rect 선언

    sf::Vector2f rectangPosition(600, 350); //사각형 소환위치//Vector2f 는 2차원 float

    rect.setPosition(rectangPosition); 
    rect.setSize(sf::Vector2f(100,100 ));

    float xVelocity = 3;  //x 축의 속도
    float yVelocity = 3;  //y 축의 속도


    while (window.isOpen())//열려있는 동안 수행하는것 
    {
        sf::Event event; //이벤트 생성   
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed) //x버튼 창닫기
                window.close();

            if (sf::Keyboard::isKeyPressed(sf::Keyboard::Escape)) //esc 창닫기
                window.close();
        }
    //"physics"

        if (rectangPosition.x < 0 || rectangPosition.x >1180) //여기서 1280이 아닌 이유는 rect의 크기값이 100이여서
        {
            xVelocity *= -1;
        }
        if (rectangPosition.y < 0 || rectangPosition.y >620) 
        {
            yVelocity *= -1;
        }


         rectangPosition.x += xVelocity; //x 축으로 xVelocity만큼 이동
         rectangPosition.y += yVelocity; //y 축으로 yVelocity만큼 이동
         rect.setPosition(rectangPosition); //rect의 위치를 계속 윈도우 창에 표시


    //render
         window.clear();

         window.draw(rect);

         window.display();

    }

   
    return 0;
}

