package com.clothes4hapiness.repository;

import com.clothes4hapiness.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

}
