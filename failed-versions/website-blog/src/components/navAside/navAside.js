import React from "react"

import Content from "./content"
import getTheme from "../../utils/getTheme"
import * as S from "./style"

const NavAside = () => {
    return(
        <S.NavAsideWrapper>
            <S.NavAsideUl>
                {Content.map((item, i) => (
                    <S.NavAsideLink activeClassName="active" paintDrip color={getTheme()} duration={1} to={item.url} key={i}>{item.label}</S.NavAsideLink>
                ))}
                
            </S.NavAsideUl>
        </S.NavAsideWrapper>
        
    )
}

export default NavAside