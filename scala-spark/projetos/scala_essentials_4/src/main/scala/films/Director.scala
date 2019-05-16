package films
import java.time.Year

case class Director(
    firstName: String
    ,lastName: String
    ,yearOfBirth: Int
    ,films: Seq[Film]
) {

    def getFullName: String =
        firstName + " " + lastName

    def moreThanNumber(numberOfFilms: Int): Boolean =
        films.size > numberOfFilms

    def directorBornBeforeYear(year: Int): Boolean =
        year > yearOfBirth
    
    def listBM(year: Int, numberOfFilms: Int): Boolean =
        moreThanNumber(numberOfFilms) && directorBornBeforeYear(year)

    def getAge: Int =
        Year.now.getValue - yearOfBirth

    def getFilmsNames: Seq[String] =
        films.map(_.name)

    def getFirstFilmProduced: Option[Film] =
        films.sortWith((a, b) =>
            a.yearOfRelease < b.yearOfRelease
        ).headOption

}

