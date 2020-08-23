import React, { useState } from "react"
import propTypes from "prop-types"
import getTheme from "../../utils/getTheme"
import * as S from "./style"


const NavPages = ( { isFirst, isLast, currentPage, numPages, prevPage, nextPage } ) => {
    const route = "/page/"

    const [ redirect, setRedirect ] = useState(currentPage === 1 ? "/" : route + currentPage)

    function validateRedirect(e){
        if(e.target.value === "1")
            return "/"
        
        if(e.target.value <= numPages && e.target.value >= 2)
            return route + e.target.value
        
        return currentPage === 1 ? "/" : route + currentPage
    }

    return(
        <S.NavPagesWrapper>
            <S.NavPagesHeader>
                {!isFirst ?
                <S.NavPagesButton paintDrip color={getTheme()} duration={1} to={prevPage === "1" ? "/" : route + prevPage}>Página anterior</S.NavPagesButton>
                :
                <S.NavPagesDisabledButton>Página anterior</S.NavPagesDisabledButton>
                }
                <p>{currentPage} de {numPages}</p>
                {!isLast ?
                    <S.NavPagesButton paintDrip color={getTheme()} duration={1} to={nextPage === "1"? "/" : route + nextPage}>Próxima página</S.NavPagesButton>
                    :
                    <S.NavPagesDisabledButton>Próxima página</S.NavPagesDisabledButton>
                }
            </S.NavPagesHeader>
            <S.NavPagesInput>
                <p>Ir para: </p>
                <S.NavPagesInputPage max={numPages} min="1" type="number" placeholder="Ex. 3" onChange={e => setRedirect(validateRedirect(e))} />
                <S.NavPagesInputSubmit paintDrip color={getTheme()} duration={1} to={redirect}>Ok</S.NavPagesInputSubmit>
            </S.NavPagesInput>
        </S.NavPagesWrapper>
    )
}

NavPages.propTypes = {
    isFirst: propTypes.bool.isRequired,
    isLast: propTypes.bool.isRequired,
    currentPage: propTypes.number.isRequired,
    numPages: propTypes.number.isRequired,
    prevPage: propTypes.string,
    nexPage: propTypes.string,
}

export default NavPages