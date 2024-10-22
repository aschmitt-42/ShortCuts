#include <iostream>
#include <fstream>
#include <iostream>
#include <string>
#include <algorithm>  // Pour std::transform
#include <cctype>

int main(int argc, char **argv)
{
    if (argc == 1)
        return 1;
    for (int i = 1; i < argc; i++)
    {
        std::string name = argv[i];
        std::string nameCPP = name + ".cpp";
        std::string nameHPP = name + ".hpp";
        std::string Define = name;

        std::transform(Define.begin(), Define.end(), Define.begin(), 
                   [](unsigned char c) { return std::toupper(c); });
        Define += "_HPP";
        
        std::ofstream fichierHPP(nameHPP);

        if (fichierHPP.is_open()) 
        {
            fichierHPP << "#ifndef " << Define << std::endl
            << "# define " << Define << std::endl << std::endl
            << "# include <iostream>" << std::endl << std::endl
            << "class " << name << std::endl
            << "{ " << std::endl << "    private :" << std::endl << std::endl
            << "    public :\n"
            << "        " << name << "();\n"
            << "        ~" << name << "();\n"
            << "        " << name << "(const " << name << " &other);\n"
            << "        " << name << "& operator=(const " << name << " &other);" << std::endl
            << "};\n\n"
            << "// std::ostream& operator<<(std::ostream& os, const " << name << "& other);\n" << std::endl;
            fichierHPP << "#endif " << std::endl;

            fichierHPP.close();
        } 
        else
            std::cout << "Erreur : Impossible d'ouvrir le fichier.\n";

        std::ofstream fichierCPP(nameCPP);
        if (fichierCPP.is_open())
        {
            fichierCPP << "#include \"" << nameHPP << "\"\n\n"
            << name << "::" << name << "()\n{\n\tstd::cout << \"Default constructor called\" << std::endl;\n}\n"
            << name << "::~" << name << "()\n{\n\tstd::cout << \"Destructor called\" << std::endl;\n}\n"
            << name << "::" << name << "(const " << name << "&other)\n{\n\tstd::cout << \"Recopy constructor called\" << std::endl;\n}\n"
            << name << "& " << name << "::operator=(const " << name << " &other)\n{\n\tstd::cout << \"Assignment operator called\" << std::endl;\n}\n";
            fichierCPP.close();
        }
        else
            std::cout << "Erreur : Impossible d'ouvrir le fichier.\n";
    }
    
    

    return 0;
}