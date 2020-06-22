package com.example.goods.repository;

import com.example.goods.entities.ESProductDO;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductsRep extends ElasticsearchRepository<ESProductDO,Long> {

    List<ESProductDO> findByNameOrIntro(String name, String intro);

    List<ESProductDO> findByName(String name);
}
